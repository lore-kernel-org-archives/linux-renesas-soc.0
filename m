Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE537DEB6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367742; cv=none; b=CW5uzbebKzhYUGOibbeIp9Nk/stIExRkkXxoI8lEew5NiNAIGaNaw9l1QNDmB/vDZgKAhUoJx8rpQIxHuLyao8lkVrUe3LZqRpruOgz6j/eOjd/49sh9GLqk/PpnEOauPpBN4S0QlVN4pJ8k+eTfytrlyzDBmLlBcq9a2mJRXb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367742; c=relaxed/simple;
	bh=f/EWsaBqfGYqtSTvr+nbCLuWbwHMz6uqqnQeTngRaRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJezMX03HdvucxU9FxQYw2rtgOvK8QlIkYwjRN+jtmIT+yk5kE7ICGTD4EezqyfxVUtfIzKo9AQInbQ+SLawnV3l2HHYfl9cy9uaH9Pp9l+mVcNAr14ZbZQdTWfvNKnm8J+XgpBXh8UgHWi5SCVZVPTE+S0sMHEaM+tirWcgQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-745659c70ccso286214137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367740; x=1786972540;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cjoz+EifHARoRnDPa+woJccZc9C1BrhkE/YBcvHNPwQ=;
        b=VB8oG3f3Ryl3ZOEpOTofFQGTkmYl1dFqxjJBZVBa5Z/4nfR2U5KK703RsX/D9MYSrH
         AGiq9UJMy0raVUIwwvLO74W83FU7nhMrIgD24f00LWT24zs0Kp1HGEKh808KuJHZU0sG
         T/RT6E4k/YLLz1oLr47vf7St4csHQW0MbJudQk98X7e/V3VkD44rkPHP8qx0rFqTvDy7
         DvxVb9BiSZUxCnvje5O/zEcJlZr2HCjeNVq/m+4zQiT4nuLQard+l7+y/CyN5muukYfi
         iOMTtIpmZpJyIcKY/B+3MuX7uBv9qapYxKtVSeaPJv5mKZhaoN3L21UAc6587ettoEUI
         Vu1A==
X-Gm-Message-State: AOJu0YyKB4dkHqLAhXI/DSiEDRo3xHID/ty0XBI56BucGvBywzU/FUCh
	Y4k5xcuNzifhRnkgCRS0HWW3LGp7bvVaHgSYraxFQWN0FwYrUJnYaH8nnxNv13qg
X-Gm-Gg: AR+sD10zQ42Ki6FdE5VV+p1o538nFJyj42nZFTpevcF/wu21Bj0OBpd0QTWb63ngFuK
	TAYERBcOrVU/DAePzFciISE883/WD3LAtsWUV/IFjfZASBPkWOwg6DYP1xgkpUGiTOedxc2fc8y
	GHRVFkl+PAW4zf4WJi3Rm//pCPj0KG7opiA7dH0ojHTG3w4mXI+G2/sgJ2zFKTZh8bxghXjzTvJ
	oCQlkDCNnfNNBoVUD+5xwKxqyo6KPiqBAsdXOZGvZwV25/jefk7mXdnnvphFT4PQziNCfvSe6ur
	Ka4ZYitVi5yTJO5JFuZvsoyks3jcS3dAu2CWIfMzC5gp4dN09LkXBnaBpxqVFptpDM2GbTs1CS3
	RUW84oHROZ8fJKqLL1SpzdVIz9TBe38euN6nVI5Whu05wqgXEhrBps4xrQPTra19E12HCRgv7KM
	ZsNbYVlobIsxNyq6mYOuhi4Tfi9kRth0L8iIg2Y2M9KHafMyGf68W+y4Al/Xn52hB2BkyNn7MAz
	ckneTE5/tgzA6UcXZtIvswBRQ==
X-Received: by 2002:a05:6102:3f0d:b0:738:84c:6b3 with SMTP id ada2fe7eead31-768e5d22ae9mr317744137.3.1786367739989;
        Mon, 10 Aug 2026 06:15:39 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2eac14fsm3488041241.7.2026.08.10.06.15.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:15:39 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-76535268562so322631137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:15:39 -0700 (PDT)
X-Received: by 2002:a05:6102:1492:b0:737:9edc:36f8 with SMTP id
 ada2fe7eead31-768e5d1e555mr321103137.1.1786367738750; Mon, 10 Aug 2026
 06:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260716101030.15252-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwUovSSQC2YMkWMpCJpYf4xZ0iQiC+YNr0MHdnhg=5bg@mail.gmail.com>
X-Gm-Features: AUfX_mz9Ge_uOoBEAXZRrsBhAljgE5JRYm5OavXM3Q4UhEdxtWBnLah-SR0vkRY
Message-ID: <CAMuHMdVwUovSSQC2YMkWMpCJpYf4xZ0iQiC+YNr0MHdnhg=5bg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: don't set status to the
 default value
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 at 12:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> "okay" is the default for 'status', so don't encode it explicitly.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
