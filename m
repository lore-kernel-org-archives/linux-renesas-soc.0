Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Matt Porter <mporter@konsulko.com>,
        Koen Kooi <koen@dominion.thruhere.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v5 6/8] i2c: demux: Use changeset helpers for clarity
Date: Thu, 22 Feb 2018 12:19:32 +0200
Message-ID: <2195898.2J8Qfnu3DQ@avalon>
In-Reply-To: <CAMuHMdVy9=e5eZZTdV6E=apvHxL3n5Qqob2JE+FsON3RG-JWWg@mail.gmail.com>
References: <20180222000531.19448-1-laurent.pinchart+renesas@ideasonboard.com> <20180222000531.19448-7-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdVy9=e5eZZTdV6E=apvHxL3n5Qqob2JE+FsON3RG-JWWg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday, 22 February 2018 11:26:44 EET Geert Uytterhoeven wrote:
> On Thu, Feb 22, 2018 at 1:05 AM, Laurent Pinchart wrote:
> > From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> > 
> > The changeset helpers are easier to use, use them instead of
> > using the static property.
> > 
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> > Acked-by: Wolfram Sang <wsa@the-dreams.de>
> > ["okay" -> "ok"]
> 
> Why? ePAPR says "okay", "disabled", "fail", or "fail-sss".
> 
> Sorry for missing this in the previous round.

That was per Wolfram's request, and because the existing code uses "ok". I'm 
personally fine with any.

-- 
Regards,

Laurent Pinchart

