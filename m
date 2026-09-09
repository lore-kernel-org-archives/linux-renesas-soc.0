Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7D563FA6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967887; cv=none; b=qZsGSTLmS/BzT4aLt+aWjrhDroRefVEjha+GsCG1qmvvEBIULoFY6dIk6A91nZ8/DKoQ63PLVSXhkohNCyJCOWa5rIejMGrMIHK/8ertXhqSUD/Azls7g2y3BcvVZXMZ8KDajcjpWHpPaMAzYlFOiAhyU3PoQWiK65O0BEDRPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967887; c=relaxed/simple;
	bh=cWd22r2u/Sd1yN7AwMDP27IBd84axRoEi/2XAth0xWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tImgmgIuT1dywIs83b6zoP3fc1Pmkn5+m0mz8kUu6frGk9gAw1I0hDZW3CtyuZC0/QOz6UAEZ6mFRGdGRGI1rgkA+uagJQRyH2sPXhK/NCPb/wQg9uM/fHNGydvYb7BZL/bRwA7TvOUwMRwDb2izVJxa0cYnB2qoZXWTQoPn688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529300so435067e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967885; x=1789572685;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NEpc/1/47AsHfaTxY/tAR9B9xl8xB58wnw6vmMA8FEI=;
        b=YbU544N0iUkjFVJzIm99HkhVQHpXwnkhL34SWrkppNJ0u3grcUA0soDyLJWTVyj3rr
         hOP+c2J6i9Wlu/Ar0S0xeIEnDCSl5VEfn29JEb7P3FoctYIAxQdRmG9QkOv8xIGXKeV5
         5BzzNS00fHmB54fyvKuYvLnozsdWYB7fTeS4D7g3VMfiN2w8KJCSZ6mBDCgqhZ0ZrAeu
         i9I9cvycu/psYAlKR5iPoWxX/Lo4ibO8KrbY/zh2T1gQcPQWxMau/hWvG2eq1hh+G9YY
         h3hKO+aiqckNaA2vWU73B32Ecnb+M5VNPgcgt/IPBbB3krLX/mHiK3CpbiarEndw83Ac
         di2w==
X-Forwarded-Encrypted: i=1; AKwUvByskUvCsIke3My/nbJpNoxcGwXmTjX0mT3eP8gcdye4mP24mot1mPwYZawzQEuOsgV2DppwKZXaoSUNQy2MGhB5uQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n+N0jEJNwu36fe2UBpi4nGilxvVryifN9UzZtpy8RWUic75mXy
	zUMqtvuW9LLmy4dQL6hhnAKz8PjhFAWeNV+ObN1Ff/iDngwLriJI8aYj5WmKZ22iMbwWWw==
X-Gm-Gg: AYBFou28jXRuTPFTS3qzjh2rDrU8KhUc8aMw3CS0Q0etLHQksEvwMcx4N3eXuvgQZII
	sptIv8BZhtYwOp3UT3yNjb7N4nnxSyEp1cdJdQQrtCiQtYmA4PcjSaKtph/LWRON1dbyVgFDguW
	km5+c3dWZE8s8FvbXm2B6H9OLSFLPmp7CUMkOdx/aX8iqMRBVVvQ1KeMiFrG0kWO8VEigeuLBfo
	UtiBHaJxqiyhBHbkVyyCiKoqf5JthIUHPIQMBJQm5KK883bFyUm2st5eVVhDBgOe42xSqDiSUuU
	BrPYlxxplwtIcsfdRM56Jxj0JsfEmaEXGHoS+d4Vc4K33rsvEmq54ewOateb8TjDfXpJMa+yjnf
	JYlhm+6DM7pWX2KPSGHuSA+e0nINB76kzuEv2cXPP7B73NcBqUcPc+4cm9bxKufY9vdOKdxXHZB
	mW6yEiHGXh8FFqLOIK+XyXdoLvw9koZZvkR2PZANGVGgWZ0fJ5dFEt3DLexzR6atFzZTxg5/wvW
	fUDFjZbOx+hnm22d38WYZ5nxkosEX9BPPzayA==
X-Received: by 2002:a05:6122:e189:b0:5c0:fb8d:9993 with SMTP id 71dfb90a1353d-5c828511234mr3346600e0c.0.1788967884747;
        Wed, 09 Sep 2026 08:31:24 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm12581004e0c.13.2026.09.09.08.31.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:31:24 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso352224241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAHsYcpowHRL0klSLixXhTklaGeF1+0k6wyO/S6rajpPmlAnv4vZDsYRbxYf0sguz2IRORDSxuxcV5ziD/mCaHAA==@vger.kernel.org
X-Received: by 2002:a05:6102:8095:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-78f757d562emr2534584137.8.1788967879800; Wed, 09 Sep 2026
 08:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:31:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
X-Gm-Features: AcwNN1U9fr4mtgt5B_Ox8jzqkFHdJzcqPtQLtvvJUBaj2_brnmaTf7bMLwSgx_8
Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 17:14, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop the unique spi controller node identifier
>     - Switch IRQ to active low
>     - Sort compatible and reg properties
>     - Add "CN7 pin 22" comment
>     - Move pwm1 node to the top and add comment
>     - Rename MSIOF0 PFC node

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi {   /* SPI_1 */

As this lives at the root node, I'd rather change it back to
spi-ws-2ch-canfd while applying, if you don't mind?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
