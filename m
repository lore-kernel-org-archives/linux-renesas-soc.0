Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDBB3F9A0E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372646; cv=none; b=bNz1PQVp3dwiBundT6F1yWSuoxEujKvK82k7FxjNOiI59ucXIt5NoRZIWbygBjGKY++ISPr8ZpLseuq9n5s59hQ3Oe9mgN7HY/g3EGdLeYj7qA+M+9llxool8nRx/YamouinBlNvbCvD9X3lfvKJnrqISzmNvyQHpGfeHnZhfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372646; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otRzdFoUOryt/ItptzJBB5WhUQ7XZiNAljCT8bn/54IKa5W0uiq+CYRfwVww/CedJXWyAyvRoilxHMuHjIfpOFp9nW2U+nBXeYyR4s3sYm21viF5YtXV2m9UmQFPkuVWtj6QUQ3ZNciVBfifLmiVxdoU4N+Mu/iNtL1ccVIsyXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so1200982e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372643; x=1786977443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=WDvYw0RDUK03d84j4lv8Xm4iQKsgvllbmsd5LBgL9bDV63/pK+S78d1MwjcDLCukpR
         bwnrIRB4PJBjoytlciMmKftZs+QpJCTZpC6EnhG1qjZpgm6WzEiQhdaJRx7P4fOjfJyG
         pzydbYaweOFUQ4mjuNu/MlBxnK1yFTvJA0rWbY+aiRRPbgF/b6PF+27S0f+PD0HdwtnE
         WXUwPrHxoPm5svuxhdGCHogEWDL1PUZa4CTCqPMkpCYr6oWCPnpnOYN0vwvu9fzVI99E
         W/FNUTrsIgJORUnPvbBzQF1gHAzg9ewuDu0udU/BN/adRM9lKJWYX0hwbhuJLOuViNF0
         bFMA==
X-Forwarded-Encrypted: i=1; AHgh+RoLywYm8mr7eZ9rN2MMd5Ki9Z4cZNX5nGxEBNqOO0HwIfaAyAfOAfyJrrySdA1mORScqiwe8f0+IAdju2yVa3xjvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOgf0fM/qXgveMUo1rMMILjN7oBUcxB1ZVAyl6dO8LctFMAiH+
	ujP0h5vgNCaN4BuvPJbxltpDtg+cy//dyUOSFxCj6GS/MBlwS/t+3eJOoSx9FBNw
X-Gm-Gg: AR+sD13HAfBLSirSpTqaJpbxw4ED094m7l28QnSsH16ebfpy8ES2JCvdDkr1JhOAo/3
	oor4lH+2gA/CBjd7QDvwyM+TX7yvedDS1z1V12s9G/2p+WjaMYZgXmD56L7XCQOSvfs/OfESyjX
	6qyzdUg+k1PSoiHjBOXKGF9N9d+1LmwGEi4ZUZwYsRwqu+DleykuCAdMPyaDu8dW6+cWJFf6hfM
	XavihtceyZly3gUzBcjZZJzsrAcV9obyu+6AkOBPkYCrpZLw9VEAUgxtLDkizAq7DnAOCIQ1O/C
	5naGS21JxJqrMXKtyR5IS+euTdYtb6hOcJ8cQKy65/tKN7Znk7coruDC+5wflI049+h+q+B/Gso
	Dfqa2tk0jvw4NlC57tIv9rYd1nh8gA+S6zNzfc/2oGym1gAOw9c5ffMjvw/8EqfQgDlH6RAqfaQ
	uenc/ijIHHMIMKQJQdf5KYwWdAVXjUcRPfSpHnJeTdDYOfdslhOiGIeepMDlATefIGl0UX/3YQd
	2uWhceri/FFziotAggYvg131A==
X-Received: by 2002:a05:6102:5693:b0:726:8813:2085 with SMTP id ada2fe7eead31-760e9c4e67fmr12941563137.13.1786372643563;
        Mon, 10 Aug 2026 07:37:23 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc5e1sm4781950137.6.2026.08.10.07.37.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73b909fbb6bso1252780137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ros9DqtYA36pB2gKpzpDytnfQBLYTG1OF6cEYgf7AsVRtGYgsHWnqpZsWa/H49ByLJri+NT4Y6HNf/ho0ycYmYbEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:74f:4162:3f58 with SMTP id
 ada2fe7eead31-760e79de5admr11853771137.6.1786372640152; Mon, 10 Aug 2026
 07:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF6hVJjfR4fBbNWJirG4mkvdEAwLYbZ1WcVyw7HvYWqw@mail.gmail.com>
X-Gm-Features: AUfX_myKId3XG_N8cJulSE8NHSJR1C4r8vD32EwncQ0VsveFleyngFJWCgOst34
Message-ID: <CAMuHMdWF6hVJjfR4fBbNWJirG4mkvdEAwLYbZ1WcVyw7HvYWqw@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
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
