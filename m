Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2492681.1VCl1nfEs0@diego>
References: <1489472080-23711-2-git-send-email-vivek.gautam@codeaurora.org>
 <1489472570-26434-1-git-send-email-vivek.gautam@codeaurora.org> <2492681.1VCl1nfEs0@diego>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Wed, 15 Mar 2017 20:21:55 +0530
Message-ID: <CAFp+6iGO=zPFq7dLupPa6XitBmFOj+tk75CtQGfm8h1yKJjeEA@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/2] phy: Group vendor specific phy drivers
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: kishon <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 15, 2017 at 1:38 PM, Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
> Am Dienstag, 14. M=C3=A4rz 2017, 11:52:50 CET schrieb Vivek Gautam:
>> Adding vendor specific directories in phy to group
>> phy drivers under their respective vendor umbrella.
>>
>> Also updated the MAINTAINERS file to reflect the correct
>> directory structure for phy drivers.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Acked-by: Heiko Stuebner <heiko@sntech.de>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> Cc: David S. Miller <davem@davemloft.net>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Jaehoon Chung <jh80.chung@samsung.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-omap@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-rockchip@lists.infradead.org
>> Cc: linux-samsung-soc@vger.kernel.org
>> Cc: linux-usb@vger.kernel.org
>> ---
>>
>> Corrected Krzysztof's email-id. Added linux-arm-msm.
>>
>> Hi Heiko, Viresh,
>> It's been a year since the last version of this patch was posted.
>> Kishon has agreed to pull this change now. I am carrying forward
>> your Acks since there are no functional changes.
>> I have taken care of the drivers that were added/removed since
>> the last version.
>> Please feel free to jump in if you have any concerns.
>
> still looks all good and I gave that a try on 4.11-rc2 yesterday as well.

Thanks Heiko for testing this patch.

Best Regards
Vivek
>
>
> Heiko
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
