Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:22606 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S937903AbdD0NKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 09:10:21 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo@jmondi.org>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC v2 0/2] SH CEU camera driver
Date: Thu, 27 Apr 2017 13:10:15 +0000
Message-ID: <SG2PR06MB11655FA3940925B4139935598A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

> The driver is -not tested- for lack of available platforms, just
> compiled in.

For HW, it would be good if you use a OV7670 camera module for testing.

Like this: https://www.amazon.com/OV7670-Compatible-Arduino-Atomic-Market/d=
p/B00TKXAGZM/ref=3Dsr_1_2?ie=3DUTF8

That's what we use for the RSK board. There is probably a header on the GEN=
MAI board as well (but you might have to solder the header down).

You can just use jumper wires to hook it up.
Like these: https://www.amazon.com/eBoot-Prototype-Solderless-Breadboard-Ad=
hesive/dp/B06XKLRYRM/ref=3Dsr_1_2


There is also this REA (Renesas America) board (YLCDRZA1H) that comes with =
a OV7670 module attached.
https://www.renesas.com/en-us/products/software-tools/boards-and-kits/renes=
as-demonstration-kits/ylcdrza1h.html

  Better board pictures here:
  https://www.digikey.com/product-detail/en/renesas-electronics-america/YLC=
DRZA1H/YLCDRZA1H-ND/6173788

I might be able to get you one of these boards if the GENMAI board doesn't =
work out.
We just ported u-boot and kernel (3.14) to it this week.


NOTE: The way the RZ/A1 RSK board is laid out, you cannot use the LCD and C=
EU at the same time. So for testing, I had to save each image as a JPEG and=
 view it off board.


> The driver lacks functionalities provided by the original one, such as
> re-scaling and cropping, originally performed using soc_camera provided
> helpers.

That's fine for me. At the moment, the only users of the CEU just need capt=
ure and are not using those other features.


> I'm particularly interested in feedbacks in size/bus_parameters
> configuration functions. While I have used most of the original driver
> code for functions dealing with hardware configuration, those two have
> changed quite a lot, as the number of FIXMEs and TODOs there show.


NOTE: Since the existing CEU driver only seemed to work in "image capture m=
ode" (meaning it split the Y and CbCr into different buffers), I wrote a ve=
ry simple driver to give to customers (non-V4L2) because they really wanted=
 to use "Data synchronous fetch mode" and just keep the YUV data exactly th=
e same as it comes out of the cameras. So, I would focus on that mode first=
.
Also, I can share my simple driver code with you as reference (I put some e=
xtra comments in there). The CEU registers can be tricky to set up because =
descriptions in the hardware manual are not always clear.


NOTE: "Data enable fetch mode" is broken in the RZ/A1H and RZ/A1M...and not=
 one really seems to want it anyway, so don't worry about that mode.


Chris
