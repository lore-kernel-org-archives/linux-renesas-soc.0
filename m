Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 17 Jul 2017 18:37:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/6] ARM: multi_v7_defconfig: Cleanup from non-existing
 options
Message-ID: <20170717163716.GB2346@kozik-book>
References: <1500270596-22384-1-git-send-email-krzk@kernel.org>
 <CAMuHMdUnFCUKQdEcyFiKzVgkL5__ZLRMudCvkRxp6cBXgV6g=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUnFCUKQdEcyFiKzVgkL5__ZLRMudCvkRxp6cBXgV6g=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 17, 2017 at 09:28:09AM +0200, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, Jul 17, 2017 at 7:49 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Remove options which do not exist anymore:
> 
> <snip>
> 
> >  - DRM_RCAR_HDMI was merged to generic DRM bridge and is obsolete since
> >    commit 5c602531feb3 ("drm: rcar-du: Replace manual bridge
> >    implementation with DRM bridge");
> >
> >  - SND_SOC_RSRC_CARD was replaced by SND_SIMPLE_SCU_CARD in commit
> >    d12c6216c4a5 ("ASoC: rsrc-card: rename rsrc-card to simple-scu-card
> >    phase3");
> 
> These have already be fixed in the defconfig-for-v4.14 branch Simon Horman's
> tree (git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git).
> They're not yet in -next as v4.13-rc1 wasn't released at that time, and
> Simon is noew on holidays.

I'll rebase then on top of his branch.

Best regards,
Krzysztof
