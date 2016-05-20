Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34157 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbcETEOs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 20 May 2016 00:14:48 -0400
Date: Fri, 20 May 2016 13:14:46 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH/RFC 2/3] arm64: dts: salvator-x: add Salvator-X board on
 R8A7796 SoC
Message-ID: <20160520041445.GC25184@verge.net.au>
References: <1463629845-7115-1-git-send-email-horms+renesas@verge.net.au>
 <1463629845-7115-3-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVTMvDsmO1g=FNwpkvx_56guHk_V6Katj8e3qOdyQsjeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTMvDsmO1g=FNwpkvx_56guHk_V6Katj8e3qOdyQsjeQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 19, 2016 at 06:58:11PM +0200, Geert Uytterhoeven wrote:
> On Thu, May 19, 2016 at 5:50 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> > @@ -0,0 +1,45 @@
> 
> > +       chosen {
> > +               bootargs = "ignore_loglevel";
> 
> Perhaps you want this to be consistent with the other Renesas boards?
> 
> git grep bootargs -- $(git grep -l renesas, -- arch/arm*/*dts)

I omitted "rw root=/dev/nfs ip=dhcp" which I believe should be added
when the board gets network and thus NFS-root support.

> 
> > +               stdout-path = "serial0:115200n8";
> > +       };
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
> 
