Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44169 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034270AbdD0QPA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 12:15:00 -0400
Date: Thu, 27 Apr 2017 18:14:56 +0200
From: jmondi <jacopo@jmondi.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC v2 0/2] SH CEU camera driver
Message-ID: <20170427161456.GK11761@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
 <SG2PR06MB11655FA3940925B4139935598A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SG2PR06MB11655FA3940925B4139935598A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Apr 27, 2017 at 01:10:15PM +0000, Chris Brandt wrote:
> Hi Jacopo,
>
> > The driver is -not tested- for lack of available platforms, just
> > compiled in.
>
> For HW, it would be good if you use a OV7670 camera module for testing.
>
> Like this: https://www.amazon.com/OV7670-Compatible-Arduino-Atomic-Market/dp/B00TKXAGZM/ref=sr_1_2?ie=UTF8
>
> That's what we use for the RSK board. There is probably a header on the GENMAI board as well (but you might have to solder the header down).
>
> You can just use jumper wires to hook it up.
> Like these: https://www.amazon.com/eBoot-Prototype-Solderless-Breadboard-Adhesive/dp/B06XKLRYRM/ref=sr_1_2
>
>
> There is also this REA (Renesas America) board (YLCDRZA1H) that comes with a OV7670 module attached.
> https://www.renesas.com/en-us/products/software-tools/boards-and-kits/renesas-demonstration-kits/ylcdrza1h.html
>
>   Better board pictures here:
>   https://www.digikey.com/product-detail/en/renesas-electronics-america/YLCDRZA1H/YLCDRZA1H-ND/6173788
>
> I might be able to get you one of these boards if the GENMAI board doesn't work out.
> We just ported u-boot and kernel (3.14) to it this week.
>
>
> NOTE: The way the RZ/A1 RSK board is laid out, you cannot use the LCD and CEU at the same time. So for testing, I had to save each image as a JPEG and view it off board.
>
>

Thanks for the info.

We planned to use the following setup to test the CEU
driver with an actual HW platform

GR-Peach + GR-Peach Audio Camera Shield + OV7670 evaluation module
https://www.digikey.com/product-detail/en/renesas-electronics-america/YGRPEACHAUDIOCAMERASHIELD/YGRPEACHAUDIOCAMERASHIELD-ND/5800301
www.elecfreaks.com/estore/ov7670-camera-module.html

This implies running mainline on Peach or backporting CEU driver to
your BSP if we're not able to do so. A desirable collateral benefit in
both cases, I guess...

Thanks
   j


> > helpers.
>
> That's fine for me. At the moment, the only users of the CEU just need capture and are not using those other features.
>
>
> > I'm particularly interested in feedbacks in size/bus_parameters
> > configuration functions. While I have used most of the original driver
> > code for functions dealing with hardware configuration, those two have
> > changed quite a lot, as the number of FIXMEs and TODOs there show.
>
>
> NOTE: Since the existing CEU driver only seemed to work in "image capture mode" (meaning it split the Y and CbCr into different buffers), I wrote a very simple driver to give to customers (non-V4L2) because they really wanted to use "Data synchronous fetch mode" and just keep the YUV data exactly the same as it comes out of the cameras. So, I would focus on that mode first.
> Also, I can share my simple driver code with you as reference (I put some extra comments in there). The CEU registers can be tricky to set up because descriptions in the hardware manual are not always clear.
>
>
> NOTE: "Data enable fetch mode" is broken in the RZ/A1H and RZ/A1M...and not one really seems to want it anyway, so don't worry about that mode.
>
>
> Chris
>
