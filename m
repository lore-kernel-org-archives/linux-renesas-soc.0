Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42994 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbeBWKJc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 05:09:32 -0500
Received: by mail-lf0-f68.google.com with SMTP id t204so11606038lff.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2018 02:09:32 -0800 (PST)
Subject: Re: [PATCH 4/4] arm64: dts: r8a7795: Add PWM device nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc: ryo.kodama.vz@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, magnus.damm@gmail.com
References: <1453205888-8985-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1453205888-8985-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3f5a9ea5-3c80-3355-0399-fdf44ac950ed@cogentembedded.com>
Date: Fri, 23 Feb 2018 13:09:30 +0300
MIME-Version: 1.0
In-Reply-To: <1453205888-8985-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 1/19/2016 3:18 PM, Ulrich Hecht wrote:

> From: Ryo Kodama <ryo.kodama.vz@renesas.com>
> 
> Signed-off-by: Ryo Kodama <ryo.kodama.vz@renesas.com>
> Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
> [uli: adapted to new MSTP clock scheme]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

[...]
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> index 265d12f..04661cf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -93,6 +93,15 @@
>   };
>   
>   &pfc {
> +	pwm1_pins: pwm1 {
> +		renesas,groups = "pwm1_a", "pwm1_b";

    Why both PWM1_A and PWM1_B? Aren't you supposed to select one?

> +		renesas,function = "pwm1";
> +	};
> +	pwm2_pins: pwm2 {
> +		renesas,groups = "pwm2_a", "pwm2_b";

    Same here...

> +		renesas,function = "pwm2";
> +	};
> +
>   	scif1_pins: scif1 {
>   		renesas,groups = "scif1_data_a", "scif1_ctrl";
>   		renesas,function = "scif1";
[...]

MBR, Sergei
