Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQCF1UATHONzLnrUN=uvVw6tsErfbDS9joFo3ya5Vgy4A@mail.gmail.com>
References: <1495303131-9814-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNAQCF1UATHONzLnrUN=uvVw6tsErfbDS9joFo3ya5Vgy4A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 20 May 2017 19:45:59 -0400
Message-ID: <CAF6AEGuOETKok05PeyLpC95bPBEw5=YoxB83B-cxmAjt6JVBcQ@mail.gmail.com>
Subject: Re: [PATCH] drm: remove NULL pointer check for clk_disable_unprepare
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Lucas Stach <l.stach@pengutronix.de>,
        freedreno <freedreno@lists.freedesktop.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org, Marek Vasut <marex@denx.de>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, May 20, 2017 at 3:04 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-05-21 2:58 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> After long term efforts of fixing non-common clock implementations,
>> clk_disable() is a no-op for a NULL pointer input, and this is now
>> tree-wide consistent.
>>
>> All clock consumers can safely call clk_disable(_unprepare) without
>> NULL pointer check.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
> Sorry, I retract this patch.
>
> Krzysztof pointed out
> cleanups only for clk_disable_unprepare() will lose the code symmetry.
>
> NULL pointer checks for clk_prepare_enable() should be
> removed to keep the code symmetrical.
>
> This is possible for common-clock framework because
> clk_prepare_enable() is also a no-op for a NULL clk input.
> But it is not necessarily true for non-common clock implementations.

At least for drm/msm, upstream I think we can assume CCF.. I still
need to check for possible downstream kernels to which someone might
want to backport drm/msm.

It might be an idea to split this up per-driver, since at least for
some drivers it might be safe to assume CCF (or non-CCF clk driver
that behaves the same)

BR,
-R

>
> --
> Best Regards
> Masahiro Yamada
