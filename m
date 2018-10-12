Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58723 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbeJLSv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 14:51:28 -0400
Date: Fri, 12 Oct 2018 13:19:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add DMA properties to
 MSIOF nodes
Message-ID: <20181012111926.5fgzedqv7rp7z625@verge.net.au>
References: <1539070730-20349-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdUhEt87dggNbZHjsDu0ZVjOSxbaZBDbA4nND+e_3o40tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUhEt87dggNbZHjsDu0ZVjOSxbaZBDbA4nND+e_3o40tQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 10, 2018 at 02:39:18PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 9, 2018 at 9:39 AM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > This patch adds DMA properties to the MSIOF device nodes of R8A77990 SoC.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> on Ebisu using a 25LC040 EEPROM
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu-cn41-msiof0-25lc040.dtso?h=topic/renesas-overlays

Thanks, applied for v4.21.
