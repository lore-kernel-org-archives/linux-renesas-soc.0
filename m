Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ACA5581FC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967342; cv=none; b=YK+6UBsHl6IwlEjhZ5XJcrrnG8VxilprsgzAsP69iK6OebVZ3ezCtN7WPRKZXiGkDJT26ZnmyZn2iDFYaQ/iWOVmukeCjaOJumQCzSTlUKK9FSEPx/tfDq7gwDN3mQmx0S+RA5/pzKOvrC6mPxJkjMs5OXp7y4fnK9cuysdA2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967342; c=relaxed/simple;
	bh=JkYg2JhCpEtdX7qwSdwLwF/pqEf7ipMDvkeyNYPYWiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhzT17aSNWAdvJDfhnmaamcjWnHH6ppcL5cQuF32DOR1g3pnXOsFU0xC7VGDigYS9oYS47tQLyWGGH6KisKVipkWT7kKmVOXx1bIUkHBF2QcI2BJcqfJpuiEb8fnb/SBJlQbOJvrRXIWM2j+ZYjiGxxggBRW7Z2Lhh/NB1rZBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf959b820cso5233497e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967340; x=1789572140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvH1LN5nROju0SUpXayMHEhowOFfOFw00A7tsFfYyCc=;
        b=OH/G++l2BB4PbKEWQjNwVEZG8wMpZFSn0FkYg5C6ujSiq195STDfgARgkvqchsLfEQ
         jlyEdLrJGjVkFJd5z7nCdv1giw77+4gBmJL7PqHxT+fUG0ZciZRemfzUCsIDOJ7LCLEk
         ZkKv2YBkvrHbeQU15nx/uvzWgqWoFSfBcXmjdhPmHHIwRhEENXx1H8zC0aWDiJuGrI6R
         BhZIxLCO5CtilYlydIYrFOV/vJ0DKkBQ32hsfXHBhOkttO528DMXnCvO3fVrSyYpARIA
         WQbM7PqqbcdF8DPdUPxK9JSwu9tIi2WqHibBP6GGt4l9kh5lQqK3IfOSsbuhUaUHNU0E
         i/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBx825D3YwSG2n/UBvC5ItVrbhp7hMCfGebHD0HavVTt7WahIOIjELZuPAgMuaSQ36Wg6L8VhFb1wi7bUt16lzoz8A==@vger.kernel.org
X-Gm-Message-State: AFuF++mU6U9mBrqMsuCQKJCorK+02yPr/sguBpLebGbhJcUW3LcrcUxu
	ngIV0SS9jI/uYQAxYD/mYOLp1A2mLSOuKQR/UNIAH0gvhJpwtbGHZFyN5zh50VrPIjE=
X-Gm-Gg: AYBFou0SKAwUFLml6Toenqsu86Jx8/Y9+eQ0I+r9OTAMh7qqJdNtdKCKN0tz5mLLdIC
	i/K+ce3zMilLll6BQALyJLGPVqC1VKVEpqd364ezag/wYtTK/8IHr8niVywOHJXUkXm0cqaWTA1
	XLLouP8lHK5jIEBAekchFlfxTC2EqkaosO7InKSUJmLW/FWbb9zeygIftmC3n9+mS79gxkWLFd1
	kFqKb+UZDQfSxYbTBkPcIXdtXNQRk2gVRjwklyY4jzy5TOZ/CvjQJV2XNOcDZ0h7g0Vihd+24vJ
	V/8ATTXga/o+6SDYMV7TQfKBE+s4BDc4GLriRisJUPR8sRN74G06eXBQR0y77vMQGjy99zuEtzp
	CtHSTG9hYmW5tfb2GOovALa1wGXbvSmnT76R3aNovhwjVcZNBc35cHT7fHg8q/MoPAXYC2r+r2Y
	0O1ZIqFtaeNnSTFKNLrnyXSlRFVqHOflMRFQBtB3DrOXXYPf17LFxWBGIcHzFPNGfxYuu4M0r28
	EDIAHXldFeTHdO623iPUsa5zCISbwmZwqGGIjeu1sueEerLe7VF
X-Received: by 2002:a05:6122:881:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7ed7cba16mr19649066e0c.6.1788967340007;
        Wed, 09 Sep 2026 08:22:20 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1dc86sm12114507241.5.2026.09.09.08.22.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf959b820cso5233445e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmhJ4uYdA/KysxxrHtwOPzhQu3hQMCckV7fSLBsgcqfNJXanfoAFViS0f3h4SheIJIZM+VBQnEDlZP3LCZeJTMvw==@vger.kernel.org
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id
 71dfb90a1353d-5c7ed2f89e5mr22804170e0c.0.1788967336434; Wed, 09 Sep 2026
 08:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
X-Gm-Features: AcwNN1WgFr7t4mTZJlE0GkQEVjTvX4ia6Ekcpvx97Yyry4KwbnrUZ-lG4127I-8
Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node
 name with label
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 17:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Align MSIOF1 PFC node name with label to improve consistency.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
