package org.alexdev.havana.server.netty.codec;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;
import org.alexdev.havana.game.player.Player;
import org.alexdev.havana.server.netty.streams.NettyRequest;
import org.alexdev.havana.util.encoding.Base64Encoding;

import java.nio.charset.Charset;
import java.util.List;

public class NetworkDecoder extends ByteToMessageDecoder {

    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf buffer, List<Object> out) {
        if (buffer.readableBytes() < 4) {
            // If the incoming data is less than 5 bytes, it's junk.
            return;
        }

        //System.out.println(buffer.toString(Charset.defaultCharset()));
        buffer.markReaderIndex();
        int length = Base64Encoding.decode(new byte[]{buffer.readByte(), buffer.readByte(), buffer.readByte()});

        if (buffer.readableBytes() < length) {
            buffer.resetReaderIndex();
            return;
        }

        if (length < 0) {
            return;
        }

        out.add(new NettyRequest(buffer.readBytes(length)));
    }
}