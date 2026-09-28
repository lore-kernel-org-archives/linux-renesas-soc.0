Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6E3502A8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600427; cv=none; b=CIKCdn7IZlhMFAwFjohJaFQupAtayjh7JTEGyV55Kl1aPRQ354seUF7hcizn07r7KmLiraHpTz59lvLvOjeeuyQ0D0Wa5PsYhZRc9blUq0BMdkzKUOy1svh5UjnAFF7qHiY///wdjG8wN/yawFONwZg5+gyn8BV2slEvEqGpm9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600427; c=relaxed/simple;
	bh=J1UCxf74Usvo8/m/zisLMoMzaDelPgwuv0YSMGlmZ0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLexzZE8pZj9Wb84iheAMYZIzjUuMS5xnEDWGlk9a448/ZP1T/nLwmmbdbeFU/ppKkmYBXbnqZ4IvvaVoBELtV5XZeI4eBHMAbQqExeWhtw1euQc1URwbJuCAB7VCiVy7Oj+cndisWkdNHUx3bZewv2zDt8DtQ5l5JaotQUNPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cd1d9d66c9so909076e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600425; x=1791205225;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swC+rKb42cR1zlVWS2oz+HcUhOn9Ph47VvSZUMBtH00=;
        b=nj/G+4ScfkEzP+2guIfHweYjp3RbJlhR6w/bD+muzjmV6Ni46arnqHkJMN486ILL5i
         8rj7/RV781P3Eh/0gMmydbklmo1Vz0nv8xCIUiK5S07N3olpJ+O6ssxKIH3TSVtE0bym
         gAdBy8chEzC1KaKpqMKV4kbXAj+3U633CUt3K4sWAJwcGymv1Ai6EDwNHfTbbF8LVjdG
         BmdjxbvlceStZEEpGFOVdNT7tNMj0FETypHwMKSYKjE9kd7kakTYUPDsq9XkWs2XCE+F
         Uet5yuNmDPrCZMEBcWXUEmqPPiNExpnXigb+09qLHVN9X1S9aQsL6fP5i9lv89oojoNA
         nmjw==
X-Forwarded-Encrypted: i=1; AKwUvBwGBrWwqQb7ltnf/Vhm7UAoXuJgASxuV9uTNFUBZjAB1Mldn7XBuVh37KSt3vBnfE69wRtNCsLQnJgKetpvOJX7jA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBc8Y1YOQjpWJuu4JdemaEKSFsJ//YpUdBBFo5CchglfWYP0ta
	OCqvl7p2buECPU5eohRt9Ib7M/d2Q0BPQctwZ49Bwnk0KOYVnDRyFoIrcybBtklP
X-Gm-Gg: AYBFou1vTIR6HN4YPSIjfotKZ5WUko29KVfh/kvUq+/Ggm8lvqikzwGDCqhFzWd7Iaq
	mJvx5Lu1kv2RC/51li1ox6g9vZfHXBwOp8qp6I14V9TXfv472ZsggoDozo/6EbAEAcFxeKmE99j
	YuPgigE1YP9em0ywWhj7xd4lLc2bFIv7JOonGgvaUfQvgKxozFwzHG8GOg304McFejiXvtULaAH
	wgn7p+DfPrt3h35CjOTIXDMKfhaUYeMHw+vzwMYIFnzJ2qczEo8irwgfsbU95p9tzLSssKaKHms
	foHRQxMhj5lgBfOfQwj3aAsiszLxf22ysSZteWhTekixgfFcMQSzUyCnmDFXhZxE0Cce2QEFq2U
	G6py8JO7ugSVMtJQYPBpo272MOF2b7q4rE/5xRy67gFQ8pKi+eX+vXAEDCpMtzUt6ZdtJ/PlrFC
	fnyuAdyX0JPKbbdL5iOqWU/dKD6+6+zC0saL0AQd3b8Mu8k9/R3n2tlOZm7ExDoZhweoK4efAxa
	Jj/Qvrls/A+a8Fl+n6J5TCDfPUWiKg3KiQF
X-Received: by 2002:a05:6122:d15:b0:5d0:e3b7:334f with SMTP id 71dfb90a1353d-5d0e3b749damr566669e0c.18.1790600425008;
        Mon, 28 Sep 2026 06:00:25 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde6159d60sm8691647e0c.13.2026.09.28.06.00.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:00:20 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b3acd242adso403164137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQmcOro5DM1PjrbKmjBsluivmz0ybFe6/1gpAD3oHTyXaLe8JH/imTl3svObwALPud7EpIgaIupFXwNQgago/jRA==@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a7:19aa:f0d2 with SMTP id
 ada2fe7eead31-7af1f40a6ebmr3883955137.31.1790600418873; Mon, 28 Sep 2026
 06:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:00:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHAFoa+RvhzXDS=hijNXqBk=Fnt++LVm5rTiRQzzvm2g@mail.gmail.com>
X-Gm-Features: AclHuK_dpCNqN6yq7ND9MT0G1Ai1EvNq4GQtb8fvGHVDUDen2mnNfX37jzbkzIA
Message-ID: <CAMuHMdVHAFoa+RvhzXDS=hijNXqBk=Fnt++LVm5rTiRQzzvm2g@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a779f0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4 documentation R19UH0161EJ0140 Rev.1.40 , Jul. 31, 2026
> chapter 9A.1.1.12 Software Reset Control Register 11 (SRCR11) bits 22
> and 21 describe PCIEC ch1/ch0 Application/Local register reset. Add the
> matching reset into both RC and EP DT nodes of both PCIe controllers.
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
