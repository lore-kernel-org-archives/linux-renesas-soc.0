Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:55302 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbeHBBDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 21:03:09 -0400
Date: Wed, 1 Aug 2018 19:03:44 -0400
From: Rich Felker <dalias@libc.org>
To: Rob Landley <rob@landley.net>
Cc: Ulrich Hecht <uli@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH QEMU] hw/char/sh_serial: Add timeout handling to unbreak
 serial input
Message-ID: <20180801230344.GJ1392@brightrain.aerifal.cx>
References: <20180730130234.30020-1-geert+renesas@glider.be>
 <1115027626.150336.1532963923061@webmail.strato.com>
 <97622558-a520-6ab2-b61f-8038ae61b451@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97622558-a520-6ab2-b61f-8038ae61b451@landley.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 31, 2018 at 11:36:46AM -0500, Rob Landley wrote:
> On 07/30/2018 10:18 AM, Ulrich Hecht wrote:>> On July 30, 2018 at 3:02 PM Geert
> Uytterhoeven <geert+renesas@glider.be> wrote:
> >> Fix this by adding basic timeout handling.  As the QEMU SCIF emulation
> >> ignores any serial speed programming, the timeout value used conforms to
> >> a default speed of 9600 bps, which is fine for any interative console.
> >>
> >> Reported-by: Rob Landley <rob@landley.net>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Works for me, kernel 4.18-rc7 for rts7751r2dplus.
> 
> Works for me too.
> 
> Tested-by: Rob Landley <rob@landley.net>

Me too. This would be a very welcome fix for a longstanding and
annoying problem.

Tested-by: Rich Felker <dalias@libc.org>

Rich
