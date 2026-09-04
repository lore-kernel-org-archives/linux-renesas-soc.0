Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E73CB8FF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508864; cv=none; b=X6UkOYQJGTzP+61iU1GpYh87MvU9KNLaxEU6DkJi2TUIvhJt+/3Qpjub4hpzZhyn8A5wNN2xlOPrjh8NcYnhutKT54y8HB3ypdXoemb0vXUr4STikRRbRrC3W05piWUxog/JBLfmdctXOxYcyyPpO3hYV1pFJjV+VXP13OvGv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508864; c=relaxed/simple;
	bh=5STgmEpuSXLAENtQSqsuFnM5l/nP8haJUcsvw0rzQek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzDfT69CEPnYhsUTgk3dUPgO5uJ+BYwHnykkTmuEvAxc0ZhNmoRGap8qXIVkpei8CyYlhdbf/HwNH8Nn6uvIKnWaOc68OA/RJ1gX4kMkNGNEdKwp57Fte4zt0jEKGrIjGtY6wHs2nnXZv+vrtmJB0VogTypfBtWP+kKXxiiXkNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7866d924eaaso569366137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 01:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508861; x=1789113661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHcVzyvg5T1LbBIIYfTsEAB71A8C4BjQEyDgYTrzH78=;
        b=GWpBuZFjaEJL/XroBCpJyf+puQOnvhVh3gdgE7Uh4kBaN/GcdKt/JwuXzYHazoqig3
         ylW8ALN3dqKmrtjhtTV2tMHbunnAyaKtoS/7bojJZc8MQSxX4aaxKgFzf3SNfE3QS0Mm
         7XZ5dfCuw4gqLl69tFj4AjPgU4ov82HXaYTomMHnU+36MuaORjj3lVrBCx4P+2oxIkR9
         PMxSYJ/F0ypwKgi4fhSrvlDz8nPWbYe/f0a24pKxKPYExNBG5QZPTn9AKxVwmYeOu1af
         L4uYdvC4IfQyaBdDk7zCNijRxQxCn865JvDjFsv7nhWS4Ori3wnPG2C1ZsI2FsK1uKEk
         B26Q==
X-Forwarded-Encrypted: i=1; AKwUvBya7ULEIcTkDlMyRncG4mOEK3Q1es701mNwEmzjEs78yabY7nRTXJj0wVkMlhf/KJvii9oIStZIqztayZ5kizVpng==@vger.kernel.org
X-Gm-Message-State: AFuF++k52efYvFWDXPC+F0JnINsYD4l2NGp0c4AyprQswq1niWD4ZkAb
	sRVRBe+j/mHybknwkL55GKdWCJX92+w1xO/X/agnCibfZFCXNU1OlrAqXJ/HSYGSEIU=
X-Gm-Gg: AYBFou2QLBrFgFUIcZpO9FfLzfG83tYGP6bg2hVXImvdr9vY1elkNnrZSDrdO/13yQD
	yt0pPTuQxsDdGjIkS9AwYe6Ukkdsz3+UigWdbIkb5jkrpyXv4djlcMrOV3PU+5GcZSuIMdQ7Kg2
	dEFv9pM1CXPlr53cxKLmXCUOQWicd20cCQozHXOmIvghMjUJHZTai+50Fr4ps4vCLNNM4PJIPWZ
	TP8PfaDTS91CEI0W5zxKDmPTDN35II4EcIUzqRKEPBsG4zusDCCaXIFnxhVFDl/5CFDbMZU5nec
	DMC+vw7D0JxN2v/GOtbLhfoc8dxkL0JP/AA1k1JOHNDTnNXMiP0aYSO+d7veIvZvQZRkSlq/JRI
	vrC9nwwbVsGjrYu0TI3PdH5fgGWVIjxGyBlVDiExeHmYTzS2JfBsmXRtD5xZV4huj5OC4LnwItC
	aLMmDOhhsMYPhdtO5uJ/MEA1E/ny7uzv2frRHF7yGiQ7UE1mcWqYzLZxra3bdMpCCg0A1wLKytT
	2kMmMgY0AQE3McHQSN8AWIheQ==
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr1486139137.7.1788508861317;
        Fri, 04 Sep 2026 01:01:01 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1dc86sm1076005241.5.2026.09.04.01.01.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97e96666dd6so494022241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtFp7KvILQHBC+AFlPJf1VO6Wvjut2V7en88wO74B8jzXIRGGBReiw5tCpdmETW+jqgc8WdJko/ERayT+RyExpLw==@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-78a4a97bda0mr1434786137.11.1788508859808; Fri, 04 Sep 2026
 01:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com> <apnUfCIcTG4bmYZF@ninjato>
In-Reply-To: <apnUfCIcTG4bmYZF@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOY2CYKfhmx4qmRPkf3a002NEbWuwafLvrJTXvLb9PLA@mail.gmail.com>
X-Gm-Features: AcwNN1URdf1eUYUIsC6Dx67B7nRZjxmnJO7wd9vXW0tYWJ8jFblIIeeoKCEUiQM
Message-ID: <CAMuHMdVOY2CYKfhmx4qmRPkf3a002NEbWuwafLvrJTXvLb9PLA@mail.gmail.com>
Subject: Re: [PATCH v24 00/15] Add Renesas RZ/G3L SD/eMMC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Biju <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Although there are still issues to be handled, I tested this series on a
> R-Car S4 (Spider) with HS400 eMMC and on a R-Car V4H (SparrowHawk) with
> a UHS SD card. No regressions.

FTR, boot-tested on a wide range of Renesas platforms (RZ/A1H, RZ/A2M,
R-Mobile A1, SH-Mobile AG5, R-Car Gen1-4, RZ/Five)
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
