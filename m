Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36714 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752414AbdGFItQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 04:49:16 -0400
Received: by mail-lf0-f43.google.com with SMTP id h22so7892301lfk.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 01:49:15 -0700 (PDT)
Date: Thu, 6 Jul 2017 10:49:13 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCHv6] arm64: dts: renesas: salvator-x: Add ADV7482 support
Message-ID: <20170706084913.GN18905@bigcity.dyn.berto.se>
References: <1498576541-15384-1-git-send-email-kbingham@kernel.org>
 <CAMuHMdWbxsj_=quOaZfEBfhN3geBhcYaOkBXUAeBazCM601uNA@mail.gmail.com>
 <f11bb86a-ce60-3f18-333d-0d008dab4b2f@ideasonboard.com>
 <20170705183315.GL18905@bigcity.dyn.berto.se>
 <CAMuHMdXmN=TFhs0pyZohfGzksrwZjtGiFsrN=BG8yZe7cV69fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXmN=TFhs0pyZohfGzksrwZjtGiFsrN=BG8yZe7cV69fA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2017-07-06 10:04:42 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Jul 5, 2017 at 8:33 PM, Niklas S�derlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2017-07-05 11:22:21 +0100, Kieran Bingham wrote:
> >> On 05/07/17 10:43, Geert Uytterhoeven wrote:
> >> > On Tue, Jun 27, 2017 at 5:15 PM, Kieran Bingham <kbingham@kernel.org> wrote:
> >> >> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> >>
> >> >> The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.
> >> >>
> >> >> Provide ADV7482 node on the i2c4 bus, along with connectors for the
> >> >> hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.
> >> >>
> >> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> >> ---
> >> >>
> >> >> Submitting this directly to Niklas, as these changes depend on his VIN
> >> >> DT patches, and has agreed to 'take' this patch on to that series.
> >> >
> >> > Yeah, haven't seen any patches yet adding "csi20" and "csi40" nodes ;-)
> >>
> >> I defer this comment to Niklas :-)
> >
> > Yes :-)
> >
> > My plan is to include this in my vin-dt branch which I also would like
> > to include in my submission to renesas-drivers. But given the fact that
> > I up until now have not included any DT changes for VIN in my
> > renesas-drivers pull requests and that the DT file structure is recently
> > changed I have yet to do so.
> >
> > My plan was to wait for -rc1 and rebase the DT patches on top of that
> > and then ask Geert and/or Simon to have a quick look at it so that I
> > don't create problems for the next renesas-drivers release. But if you
> > wish I can expedite this and rebase it on-top of the latest
> > renesas-drivers release and pester someone to look at it so that it's
> > ready for the next renesas-drivers release :-)
> 
> I was referring to actual patches posted to this mailing list, not to DT
> commits (hidden) in a git repo.

Ahh I see.

Yes I have not posted the DT patches to ML since the bindings for the 
VIN Gen3 and CSI-2 drivers are not yet accepted upstream.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
