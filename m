Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEF3F329C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372812; cv=none; b=DVC7PzJTBtXyVtbgGrJDHkUDOS/AeQdg0Iw1QXzKhaiqdTvQGLUY9e/xhrEAPrNBSQrCaKrBT9Mcvhe4WJ4Yu0T0kvifz0rlJNgaOd/vPGtue9otiw6t1zW+xicVQShduzxTiYmKk6S6fX9x3bcgIobzKcIqyQoayZZH86mmBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372812; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmoLUDXmugDT2cPWFpsExTqGHC0lp+01Kn1Pm9nuIoT6fesH1dH39k88gnRHwj3oQkFEucj9fhFgWkxLZbQVpaS7PLyUDLhQXO0qSf0Lu+3J/uaOTEhHbWaq0liVg7rHM22yT8Q9CtQURNvyvn/LLWUHxlERgDxt3MaUlODnj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9770e900464so1560379241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372810; x=1786977610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=MGXoKKpooNUOtq/Ti8qJXSBwM22A9LVUxefWMtoSR54+E65JbgvV4m10eEVkyr5xqS
         708ml2IkZPsJQFjwHD7dOiw7LJPBXAPp1cQ5JTFQSjMicw5eNpQIIz/jbJ9l8Wx9Hnso
         O9x03Ck8ctyZpxYRTvh8/6Fr6uMWRhJ2jugEZ5g/xwcY84OETFV16Vx7l4OCIEYPMbOh
         KmkfHs0vAXAUDUWkqNmDV6grAwJyuUBJUGxXtBCATsmVjAiQvzEp9B2luKcg9cY1mK2I
         FTjtZrIAx3kb1ortUfn0GPXlBMpuHwAvzviEn3FDu6CHtzt5p80FnJhrR7l0Za986dXR
         S9Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrpxLuJ4aTZh8YkYT1aNuab9yOZXZAROmR3NtZF53sYGdy57q/d4OoVAEy9RdEhji4iB7vKM5jq9ednCqrDb7yuGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3GSyjneuXJxvhm29T96uzntlCI/e6OlerdIuBuTDzy1CiSPf
	vdCV03eUtQj7Ajp2K+QtrBtdvQiXJnaAyYLJBPE8lHp8qavnlAEB6Y/HmJWkRhp+
X-Gm-Gg: AR+sD11zOIBX6ykjBVVdPmjRTY8DhcDeR48w1v2P9KFXVOKh60LqJaF6r9yGbgYlVq7
	1oY9C/ku55nvpgbRIy3FQO0uqIfh7FGq8+hG2lHlzj1IBDAcPg+1bynBo287lvmuTzH3xsXmcmH
	GRVvZZq5QlIsql9gRvW6w0h94+DEyNHurrEsqD6CtV/L6MR4RfEH8O+GqnuE1h2qTZM5DwXJJN/
	9wG2AmWd0arxExRl8DWJQD3yh7TDO3mY1RXjkHLp8G/AaWFaerlDdAc4AmAwz5hXVhMwwRIzjZP
	Lm+FzC5NOqWQM4ApIb4E9uwksjth5HhyQz7KPqKIEsy7Cf1l2Z73VRYvDQ1D9ZqvCvLlgTAXe+9
	ZfVy456t61YfXpOLNkds3e1jWUKZEuXRv+Kk1kR3FFhWMoy6LJIEMUUg+lsw8t4ZMcZqw4HmlQz
	2mfR0/DvCvAUlncFKt6LErT6GXcL023rMkz/ZTMP3t4UBbYgeViDmMu05iAo/V8qQE+s5wO0sQS
	CVzSMVecinUVdbXep96RorIbw==
X-Received: by 2002:a05:6102:4415:b0:745:53b2:d651 with SMTP id ada2fe7eead31-76521ef6576mr2187592137.12.1786372809656;
        Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303b72bsm3422948241.8.2026.08.10.07.40.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9770e900464so1560364241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqaFp+0Q9xsPiZMuNSDZ32Mme1lpCc/yFaV9M3WPMoHTj5QYQIBPaUD3VAoU0Fz5Cqt0SX3RcSVgaksvBkygNWiBQ==@vger.kernel.org
X-Received: by 2002:a05:6102:a157:b0:744:e49e:df75 with SMTP id
 ada2fe7eead31-76522a3542bmr1213203137.21.1786372809208; Mon, 10 Aug 2026
 07:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:39:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKVWFutMzBUVd=sQjRUzbRdJ_mGc0-x+o7WsOjo+-ZzQ@mail.gmail.com>
X-Gm-Features: AUfX_mwN7lvLitZDlPNYWEclA-T-vCWyRoc3tq1Uu1GaHP9xVqafEpWVwj9VsLg
Message-ID: <CAMuHMdWKVWFutMzBUVd=sQjRUzbRdJ_mGc0-x+o7WsOjo+-ZzQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm: dts: renesas: sk-rzg1e: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
