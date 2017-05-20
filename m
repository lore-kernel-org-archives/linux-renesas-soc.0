Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1495303131-9814-1-git-send-email-yamada.masahiro@socionext.com>
References: <1495303131-9814-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 21 May 2017 04:04:22 +0900
Message-ID: <CAK7LNAQCF1UATHONzLnrUN=uvVw6tsErfbDS9joFo3ya5Vgy4A@mail.gmail.com>
Subject: Re: [PATCH] drm: remove NULL pointer check for clk_disable_unprepare
To: Daniel Vetter <daniel.vetter@intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        freedreno@lists.freedesktop.org,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>, etnaviv@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Clark <robdclark@gmail.com>, nouveau@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2017-05-21 2:58 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> After long term efforts of fixing non-common clock implementations,
> clk_disable() is a no-op for a NULL pointer input, and this is now
> tree-wide consistent.
>
> All clock consumers can safely call clk_disable(_unprepare) without
> NULL pointer check.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Sorry, I retract this patch.

Krzysztof pointed out
cleanups only for clk_disable_unprepare() will lose the code symmetry.

NULL pointer checks for clk_prepare_enable() should be
removed to keep the code symmetrical.

This is possible for common-clock framework because
clk_prepare_enable() is also a no-op for a NULL clk input.
But it is not necessarily true for non-common clock implementations.


-- 
Best Regards
Masahiro Yamada
