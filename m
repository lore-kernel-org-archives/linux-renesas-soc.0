Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180656;
	b=lwYNhVBF7J9bnxQzELyuNvR5ARzDQaURoerXGdNj/nYgvJo6/SyC2wYL6LZdxrQFcV+I
	 +8DmAU+HQy9R89na4K25JCIk9ShPkWSm98x3Vtal2zJ5H9xPfDhzsZom+koDIYegk6aSB
	 2hKR3OZ5Br/PJq6c8ewsJ4yRczu4Op2g9JX/al6UloYZe57BCnHZjIWg/sOHz4Z3/n+MI
	 D5aa8rXfLp76pPiVTeK0hUHA69rRJBnA66hhlTJkjJLtiWQD6OYvQSx5+AIdwWJ+GBGRN
	 q8bUNhAzglHyoLjXmc0qUKsJoS2h0eKdalnlxi5pomrBWss30vTNbVXulCWSIMt0UyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180656;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q6IKWBXLobC5DRUy2DzuSRlDF/SVfDMAiaTqttRtgzQ=;
	b=J/rFhIgUpUKMKf1l092rTiRRX1KDbwxCgXMGDoXIOM+CNQaJjSFIqfvM6BMDGZCSI4oK
	 h6QuyZpgs47TdCcMxAwPW9/RtCyxetvPLomEQ7gdhe8q0QfsPGrmh0pVP7IegIhRf/yFy
	 JoX8qJ6WtWSdsj/9UruOUfF2QxjV61PT+yVsrRpyPLiKZAY7wrRcdkKfVIiv5b61JABvj
	 m0SMw0VfRlViudvh1EHnaHyqI0sIK85T51Yr94Pg08TZgrgv2+PisogZ1mjcEE47bCl4A
	 IsPvGWlrSj86mtf+J8v6li85XnFCXrHGh6Q3/bKdnr2G0O1gHisbV2dA24KKOjcFDzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C2606A335
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 13:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36C2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-92125687442so5323016d6.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180655; x=1795785455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6IKWBXLobC5DRUy2DzuSRlDF/SVfDMAiaTqttRtgzQ=;
        b=aa42fNzRLiWXU0gNvmSOf6LSMWsHNx/bxUCzGc5OdbqcLJDl1QeUsEW/N070Joo0ml
         OBK0CN5oNu9qp8VQzlJa7eU/jL/flB3TxEqr4vOc69oMJpQKBhZ3cGCK5fl9a/jimWQL
         Or3FYa1z4wz33bz93H9qzyPDyh51kHIEPNXjvtnFfUi+MnoxgjAr5u1WvcUwpZCPIYCS
         LGM1ypTI0B5U0kOGln5JN/LIzsYrBU9S+oZvQlFvLt6n/BKC9wMn6nazknDevxXA8jPv
         Bug+0mHd/VwSlzX4t9yOANHHkjSjXngvGWoiu3AwWwxCwurX+omUXyYDk7SxJ0VBLD3U
         aAzA==
X-Forwarded-Encrypted: i=1; AL+hErHcFB7XbVYemJoFcj+C3ow5tnQ16O1vH+62+q5tN9aiDVuW5UTB2shRz7FxptyJgWyM4R2CQW2XgBp+5KTFsd9p0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9piQu8fjnn3+32Cflx9hBx7AGEx611/VvvuBuK01mv1xli/ZGH
	/lqE/8YTEd8S/ajCijK9vTnsV17cy+uUgMCmRhbBxuWfPcgBMXhrypgMaKr/C+wX
X-Gm-Gg: AZFdTZdGS3PwGk/O2v1TVP2mZ3pWT7qfIvYSVw8KRp+oBI8T4cAmhI5pi1WgEpb2jBJ
	ZpbABueoD0KBN23zziqltWLJyLvSllzo9C7M3poInQux4LWnCPrOGeiFmYXuoia96w44HwiaTd4
	2Zr+zJDkrqcS9xVLbeRpyu3uDH3Gp6dzCMEUl0k1BIAAEuN/5G3YvFQtP+/NeAucHImXOqlU9Ma
	/AalGQWpFEuoNmSkOSOZO3wmMYOvyVmc7P+h+8PBwrT6fV+pq+E7xH9rsgDwVO1xl9R+xcUDJvs
	ugU4+Lx8W80WTwxtMD5R0n8zrbRRp0/PRjUryYXva9BVvp2Y7KwR3DDjJteQjnqLuGtLQ3pFmX9
	bo42Ylj4KC57En9eEQ5+MsSwE8SmRylaOlHd7aZvoeMgWFqovNhoie0cw7YPb7j2bZF26jHA/6e
	v6oIOTafQgmx8CSy7ewqep1qDaK5Oj32VkOYFqTrqHYflScgsubalw+0gscpwg8Fzc7P9W357AX
	EEzJMWHJmbyhzcm3xMHT7EiqavmyaAw+Jr4WkpqSJroBUeFfgTkwFePKflX3+ugN1uR6bkHu/fa
	SiyEkuA2bp09lNLU4IPJPqfnbr7gpH9bEPs7ExcPCftB97/d54XhxDhxUnqWYDERbDBSDjo=
X-Received: by 2002:a05:6214:478c:b0:91e:a840:6931 with SMTP id 6a1803df08f44-92134b7137fmr35532006d6.58.1795180654921;
        Fri, 20 Nov 2026 05:17:34 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a1d948sm25041076d6.40.2026.11.20.05.17.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:17:34 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso287973e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 05:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFL6zBgnBzwWYg8Qe91fvG7VbVCTzQ9QvK+9l8ywMHO9KWsSd1a49ZEZ954YLLA0wx0jU2bXNcgjGd3oPtYBKZ6qA==@vger.kernel.org
X-Received: by 2002:a05:6122:792:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5ee8aeb7fcemr1220332e0c.5.1795180653844; Fri, 20 Nov 2026
 05:17:33 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:17:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
X-Gm-Features: Aa3M54qUvfxgceZpYCy0eGd3okw1JBrjE6O9xWtztWGDRZeQ1eigXq4aiI1_wUs
Message-ID: <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
> voltage regulator for voltage switching. SDHI2 signals are muxed
> with I2S0; the selection is controlled by the SW_SD2_EN macro in
> the board DTS, which must match the position of switch SYS.4 on
> the SoM. By default, I2S0 is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -42,6 +42,7 @@ aliases {
>                 ethernet1 = &eth1;
>                 i2c0 = &i2c0;
>                 mmc0 = &sdhi0;
> +               mmc2 = &sdhi2;
>         };
>
>         memory@48000000 {
> @@ -355,6 +356,74 @@ sd0-data {
>                         power-source = <1800>;
>                 };
>         };
> +
> +       sdhi2_pins: sd2 {

> +               sd2-pwen {
> +                       pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> +               };
> +       };

Just wondering: why do you use the internal voltage regulator for SD2
 and GPIO hogs for SD0 and SD1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
