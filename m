Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:35556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbeHFQtn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 12:49:43 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        uli@fpond.eu, Yoshinori Sato <ysato@users.sourceforge.jp>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH/RFC 3/4] Revert "serial: sh-sci: Compute the regshift value for SCI ports"
Date: Mon, 06 Aug 2018 17:41:00 +0300
Message-ID: <5255599.OJHZJSCvpZ@avalon>
In-Reply-To: <CAMuHMdVMToQsVpUzqnSC-OscNnNfoyOSt47S9Eset3hNPwxtWg@mail.gmail.com>
References: <20180806140755.24087-1-geert+renesas@glider.be> <2848864.ufBBija138@avalon> <CAMuHMdVMToQsVpUzqnSC-OscNnNfoyOSt47S9Eset3hNPwxtWg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday, 6 August 2018 17:34:34 EEST Geert Uytterhoeven wrote:
> On Mon, Aug 6, 2018 at 4:16 PM Laurent Pinchart wrote:
> > On Monday, 6 August 2018 17:07:54 EEST Geert Uytterhoeven wrote:
> >> This reverts commit dfc80387aefb78161f83732804c6d01c89c24595.
> >> 
> >> Deriving the proper regshift value from the register block size is
> >> fragile, as it may have been rounded up.
> >> 
> >> Furthermore we will need plat_sci_port.regshift again.
> > 
> > Won't this break bisection ? Shouldn't you squash patches 3 and 4 together
> > ?
> > 
> > Does this mechanism break anything on non-DT platforms ? If not I'd rather
> > keep it for them, and only use compat strings for DT platforms, to
> > avoiding adding back a platform data field.
> 
> Actually I think the original commit broke SCI on H8/300, as regshift should
> be zero on that platform.
> But that was not discovered until recently.

So there are still people booting H3/800 ? :-)

Could we still keep the mechanism for SH and fix H8/300 with special handling 
somewhere ?

-- 
Regards,

Laurent Pinchart
