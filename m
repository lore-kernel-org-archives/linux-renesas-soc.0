Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C373FB075
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564911; cv=none; b=WVcwpMi4RNtrEdOfoWOVvPXbD4MK7eX4+fvTgZNAjwkXAOcVYH3Q9nObbB3V+QEcnBe263nBBLpo47NefMW2rFGeMjudjOxQG+wZ9CYqwMeuiyR4jn1g3ohPhCyOa5QMl+l3Wnl89813sZnhZKNnS6WN33UAYgCPjh1GVtSYlo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564911; c=relaxed/simple;
	bh=5pP+Mhk8279qkIOdLGflEyG8YfEu5sdvMxMifNU8e8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvJPNkKOcZZK7bcaP+W2yAsUQ6yGWvxSi2YBQx1RCCBLXJUaUT/dpQu72O6Gjq649iDX0c2I8/bUpiHMv05WjlpKLN/yAhTA7sUIl6J96CuYERT0mJZH5337wdFhFfe7dR8CDnIxOqKAf057LxezcRzYKQ7g8b60xR8AvyLCgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so730265a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564909; x=1781169709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUPD5OwKoUPxOlrUbBDtLNbSGHGp+GOIie5YrA6VRnQ=;
        b=mPQt2NHt53M4vrfKgjXM83IDBUvodHzgk3/nrZAAi+3E93DoBiflMNeI3ams3G4i/q
         EMdHMeDy6bpEFbxTzpwA8IgPbShnhXqhkye6KdecNWYQx/iCYhQwv+PZq0ODLdxhHCSb
         T8ucTBX30hLJlJYkehvoeV+hlUdyXgZwY71h9alJEutgN2L5V30n2a7fsovvEpCpT1mc
         xAWt38P3ZfZPv8Auf/eZMLvhJ5bCWedW51EYX1ocOKllvtSRhWSMkNhbHbc2QkfU1uoX
         ZridqLAkHdLXxhSUGUNigrkGiNodY7O901bzMfy5tgzn6o+gOmUNqOfiIYJ5dI7rngOr
         NuuQ==
X-Gm-Message-State: AOJu0YzzIElTVOuify5YJXgBz0ZRimkpAP7CN1o3peKk8kbcjllhRLQC
	vFzJQApDZ5fUk3nJ3HgYQiW0V3JFJq+lJZI1p3EOmgP1+iaZ1CnmLoaBoiUdtrJ6K1s=
X-Gm-Gg: Acq92OG4WYYOcTzN+NEmRo01gwH1mcd9KvJHt45dRfkcFk5KUlygDps1Oa+st4zTudc
	RBOInHyxVi7HnQTzIocX034P9yEJzf+FckfO+Zh+qQH/Fku3AMEmk9DUVzwf5goU9gbV/Mapppn
	YNrSrcn+Sy/BT2vMSnWpeGGNhVzBrkrSa8qh6UcLVMq4eQ+5NEnAo+SP9r11eCT4t5iEKk3HoYu
	qatoMEz3G/mawu9UTbaT1L5CRWC/HtPC2CkFpITZ0peXIK2TDuNwZZo5QVvVoT/t0Or1V6+FPVP
	zyOZjGRtscssVBU+hosYWiLvjmk9u1YHNYoKn+cr35Kfh+mtla0JoSFyXlpoM+keLxK9EMKkuyT
	3xOZJBiX/zVw/mwFA3SC2UgBvDTxlm2JAPRs58p8GgvEEWkijnDB2X0ZjKVV4ZYY5RsqF/4UPRH
	QR5vP0XcFPvm259g/9o03qzbZugUj7gEslXGhMovqXcmywj76P7KFw0Ss/zOPibYeyqsPZbJA=
X-Received: by 2002:a17:907:c282:b0:bec:203f:7466 with SMTP id a640c23a62f3a-bf0ac304cdamr369577366b.8.1780564908546;
        Thu, 04 Jun 2026 02:21:48 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055500875sm267655466b.53.2026.06.04.02.21.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:21:46 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso678083a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:21:46 -0700 (PDT)
X-Received: by 2002:a05:6402:5412:b0:687:7fa4:faa0 with SMTP id
 4fb4d7f45d1cf-68e7293d4dfmr3216975a12.23.1780564905953; Thu, 04 Jun 2026
 02:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:21:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQY+Oe425SPwR1jvX3ut4Na6P8a+=4asz565Pk_wK8eg@mail.gmail.com>
X-Gm-Features: AVHnY4LbTi3uuwMEymEapl6w64Pb01ZaxDgzGzs7rTFgzCAq2HPVxYV4oXAMHf8
Message-ID: <CAMuHMdXQY+Oe425SPwR1jvX3ut4Na6P8a+=4asz565Pk_wK8eg@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: renesas: r8a779g0: add MFIS node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 20:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Describe the MFIS core which is used for various tasks including
> inter-processor communication. Interrupt numbers look irregular but they
> all work as expected on a Renesas R-Car V4H SparrowHawk board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * fixed ordering again (Sashiko)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
