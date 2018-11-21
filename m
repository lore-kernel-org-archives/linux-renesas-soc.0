Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33282 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbeKUMXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 07:23:24 -0500
Subject: Re: [PATCH 2/2] dt-binding: spi: Document Renesas R-Car RPC
 controller bindings
To: masonccyang@mxic.com.tw
Cc: boris.brezillon@bootlin.com, broonie@kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, tpiepho@impinj.com,
        zhengxunli@mxic.com.tw
References: <1542621690-10229-1-git-send-email-masonccyang@mxic.com.tw>
 <1542621690-10229-3-git-send-email-masonccyang@mxic.com.tw>
 <629a5d6f-5c13-9b24-1c21-461d09f1aa8a@gmail.com>
 <OFDD04CD59.10199EDD-ON4825834B.001E1390-4825834B.001F65DD@mxic.com.tw>
 <e7fd0653-75a7-249a-462a-18a7bf4616d1@gmail.com>
 <OF26D8352D.B4B02BBE-ON4825834C.00043726-4825834C.0004E2F7@mxic.com.tw>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <163dfc15-71b2-fdbe-f872-f6c6e4c3e14e@gmail.com>
Date: Wed, 21 Nov 2018 02:51:08 +0100
MIME-Version: 1.0
In-Reply-To: <OF26D8352D.B4B02BBE-ON4825834C.00043726-4825834C.0004E2F7@mxic.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/21/2018 01:53 AM, masonccyang@mxic.com.tw wrote:
> Hi Marek,

Hi,

>> Marek Vasut <marek.vasut@gmail.com>
>> 2018/11/20 下午 08:57
>>
>> >> > diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-
>> >> rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
>> >> > new file mode 100644
>> >> > index 0000000..8286cc8
>> >> > --- /dev/null
>> >> > +++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
>> >> > @@ -0,0 +1,33 @@
>> >> > +Renesas R-Car D3 RPC controller Device Tree Bindings
>> >> > +----------------------------------------------------
>> >> > +
>> >> > +Required properties:
>> >> > +- compatible: should be "renesas,rpc-r8a77995"
>> >> > +- #address-cells: should be 1
>> >> > +- #size-cells: should be 0
>> >> > +- reg: should contain 2 entries, one for the registers and one
>> >> for the direct
>> >> > +       mapping area
>> >> > +- reg-names: should contain "rpc_regs" and "dirmap"
>> >> > +- interrupts: interrupt line connected to the RPC SPI controller
>> >>
>> >> Do you also plan to support the RPC HF mode ? And if so, how would that
>> >> look in the bindings ? I'd like to avoid having to redesign the
> bindings
>> >> later to handle both the SPI and HF modes.
>> >>
>> >
>> > I patched this RPC SPI/Octa driver is for mx25uw51245g and you may also
>> > refer to Boris's patch. [1][2][3]
>>
>> Does this mean the driver is specific to one particular kind of flash ?
>>
> 
> No, this driver supports all SPI flash, spi, qspi and octa flash.
> 
> The target is Octa 8-8-8 DDR2 mode once spi-nor layer is merged.[1][2][3]

The HyperFlash must also be supported, cfr my previous comment that I'd
like to avoid redesigning the bindings again when the HF mode is added.

-- 
Best regards,
Marek Vasut
