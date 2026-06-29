Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0640BCA9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739419; cv=none; b=VoKXy0sNUuCQdkp/ZcBiXN0VM9iZi3ZFeV0PqRHiirCoqYrbznEq6LBdJjWhxxo9FvO1HxrnIVphBLQbiZ/oTVUkfmJ3LXQqmyOHUjVNRc9NKbun+tgPCvn7680IinP3mAlnZZRzMjlCkWHyBA+jKBwEh9tEj1J10ouN6tafWD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739419; c=relaxed/simple;
	bh=DdwggJ4E9iDAHbD2Qln8KIIUHdg1hwqV6Nb3MWUD7P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ms/WJzkGfbaBWkv/dHZgBYkLIthQ9LoT/tjls5gy0q/TRNT2MxVEeKjFfUPIoOiDDZNwu4/274rLBKNQ6f2/Eb0bwDb6vCRZD1BBeVuxqa1A2pCDwpDwsIfkdrrVgQYCHXU3r4ukTf1jqDi0TvNWJRVkRiC3qvXB80EONKvIAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966e7380109so1511247241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739417; x=1783344217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKY7ojYsyJyKr7XY9/LqXdE3DsIviA4GUBjQBda1xac=;
        b=VPtuiHP5E8Ay+3mgBRWgcG000QXaNJ9VUQQQWp/CzH9FodcLzsDsMqOz6NFkvb9Mmq
         7pxQEE00cGxfgFG1C9CZKhHC3MRDKst0es0MYcdgRDdpqWZdDmhvlBbP3axOYdBbwP/n
         iifRdJiFbiSsIUUBLcRfqTgDjSTlQ7j3K7WlnKkwCX6aVCzpxAQ/DCpkL4IaRVgD8/4i
         X10qjDTP0hSVynLvGf8mpS8tdkmTfH+0k4niT7F9V/bOB9ydI41X5yE3n3LiR4+o04a1
         m3+Q42I21caEpySduUnKXYswQdFlDFIIfgiL13tMcoCPbcnLN8jZ2dz780vQmWha68Yo
         h49Q==
X-Gm-Message-State: AOJu0Yxk84eGyWxME5EQBav8tdQ/0V0smZ0ztnjB/Bwp0JVUKtoyFBMY
	+XsTB58fj7FAMFA84oy72gW02mr20jLPfObn1zYa7v+/n7ub25Xj0GCzPMz/wUCt
X-Gm-Gg: AfdE7clyYGpLagIhY1yBAfI2iIxtI6dpAlu6wAcOz7XEd3ATKIKvS88dYDshT8OSNj+
	ke/7+E+CowFex+KKBZhFFSQQLqI/ZmJ3yQLma3Bj/SFt5UvsjFXt2rFqH33JfM5oWRBg1BGx6tA
	OuCkXFRdGOJvXvwO12AIhfP8H8bG5vtL4tnx1Dh5e/aiTP5PG3WLbe7ZBKU5s9u4yLgAbD0Jkx2
	1UuADNnliLwJAEAFk2OKRZ3oT+c4YDKWPNr2hJtY2yjRAzmQPvGCqY3U8QXH5h+n/23ybwzFfZD
	rQZ9zjzj8mgA/9HjB2i/fZLXG+rkWMtAe+vsJ2TChTA6pONFwttyiwdX1+pPlroqmAU+QYuxrIU
	9f/4onMiVApcf9L7Iuq4PwIq1tIAqATomdO41UUAWEhAkYMNC2W3KigLuSpJhYNDN1WsGstoKw8
	5QIqtzHO1sXXOQkyn3SjLRTWYUgn9O2h9sHbgNB8h59q9MfDTk7APNJg==
X-Received: by 2002:a05:6102:3049:b0:737:915b:157e with SMTP id ada2fe7eead31-737915b1bc6mr3082141137.29.1782739416831;
        Mon, 29 Jun 2026 06:23:36 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73853916084sm2037831137.6.2026.06.29.06.23.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:23:36 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebb89109aso2987704e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:23:34 -0700 (PDT)
X-Received: by 2002:a05:6102:440d:b0:729:cc7c:7de2 with SMTP id
 ada2fe7eead31-7343464d061mr8150103137.10.1782739413627; Mon, 29 Jun 2026
 06:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:23:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnerjPTvZvL2QmaFn3xaWA19SbLtoh6ek4Am_-nUVwmw@mail.gmail.com>
X-Gm-Features: AVVi8CfgvqcZ_IqMp2pmvREWQ09z7g6L3xLrH_AO5yEh0leI4fJK7FP82g6k3hM
Message-ID: <CAMuHMdUnerjPTvZvL2QmaFn3xaWA19SbLtoh6ek4Am_-nUVwmw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: renesas: r9a06g032: Describe SPI controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 20:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add nodes for the 6 SPI controllers of the Renesas RZ/N1D SoC. The first
> 4 can only be controllers, the latter 2 can only be targets. DMA nodes
> are not added yet because DMA needs some extra code in the drivers and
> cannot be tested yet. Basic FIFO mode works reliably, though.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
