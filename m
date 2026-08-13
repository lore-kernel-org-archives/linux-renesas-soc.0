Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB348AE06
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635481; cv=none; b=TDdenNzRIGLi5HgLRVGY5w6TMUE1Fk5O5VWEZPOEJCGNiVTETl9sxwZ3uVCOsT1AwEDntGnclIPrAfEmj6dK63tY4AJmXJq/h22lIgPhoAl7mS8wV2wjexAtyYo04D6sZhDajezo9pQ+/z9wotcTPxhi2SOvFMfo1cS/Zu3Ik3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635481; c=relaxed/simple;
	bh=jUutJajjNc7Hw1icO/JaEhCU11F1Np3J+BomYvLKJJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPfF/0+dNpbyxdSsdpucVZ71mdi+oJBZVRaQs5xri0FyX6eeBvQ888gFF5A1U18HB4bWamUQunzYZCOQEktqqkRKeiqJULvAc0GWQKqSqxbIpDy7XOHr8b7VNKyDzb3OGkwTdRFrtItYxfqg+ODBbvW0uFRXM9FDP56ClURbndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2020421077so8864866b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635468; x=1787240268;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFyxVjuWrWrBIq8VPvjLqFOlB0PwiULnnhP6Fa2htiM=;
        b=X2fWwzBq5KzP2COqQjqFZIORvObcbII34XOPdnG+eq1QUHTv3ltnXR22sKj5uUi+rZ
         xHJ/72zCu7kdA2/Hejt4KWTr7D97nU80veRKR1O0fw+jvxgW+xuNOagH9ea2Z5a24ONU
         AGtzsikZPI11612DQkGLzNfZgQFky3QztP7miiIsEijUg4/S9gAMTPxbCwd9B/rH2SP2
         Lrgl511+3T12OylVPMkhGtLo+z/iEQJYfCysIVGYeaLnweKrpkBS3KWGOnc3/JMxIKYD
         zdh+lNGY+0epfhPbmtlsQkDx2fKbf5bjbiL59apwwkg5AiWHgBysJfv+HUW+jvp9HRi0
         TmiA==
X-Forwarded-Encrypted: i=1; AHgh+Rp08t84joLCcToQbw3YBNgCX7Q7zuqbK7ipeMzgCUXMuwAWOmOBfkt21C8nn1EcZ3P2NR5Bk6huun456IsbMkxLWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8X0w3ne+QKSgg4cf6FwxGllurmSFHRLM45jbUpPtL8okedWR
	lJyTV1n4B/rkyax2BORMgDqxeVs86Y4BUhbfbC4vtUmElXC33sdmsiX3aaAQhexQGfg=
X-Gm-Gg: AR+sD12wDtBoJCcmzGPtEirYIVyXMeRvQxdW2G0mdretbNFHY5MeFPv7d+tKUzuNZsF
	cAvCc4T1TVFpnLWBa1gjSBXQZfnr2YAOjvSpixIloWnVTm70vjuxhxUh7p4EThlzzjQbk465YtY
	6K4uwK52m4ZEKjrYPqlw/fLw5R+lHzhmW7OpKHkpzxld65m7wBrvwf1CGHUtLsuUZVtJXq3uLY5
	AZNHIYgWb8x9xuHQX5vRMI2Eta76Bj1Q2Q9L1iDPPBEW3xnia7Gos4OsjPcbpPrxeboMF06THmc
	VReKE2iYVdQodwfbU2pKzyKQJqYXJWwEQzK2EDhx2MXzzl9g5CVp5/cImZmPh9a035T3y9e/Imj
	Es+Rf7NH2l7d6Y6KDnAKyQwjj+mnvpmWTY7Q8u025lMnBnan3G/n7v9toaf8/jQJ+5jKiz/MR8p
	6zFLa/xaYbSmERKr9bZW+JtPndBCLc/QqbbwrRbbCEI5xz0G2yulRzOQEUIw3tdN3BSxdPNruVN
	T26cu+55EkcxgevEvGYpjDN+g==
X-Received: by 2002:a17:907:d19:b0:c16:b87:de64 with SMTP id a640c23a62f3a-c210906ca01mr309437066b.15.1786635467574;
        Thu, 13 Aug 2026 08:37:47 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212386cb53sm5126766b.62.2026.08.13.08.37.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:37:43 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so1517518a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomegHCckqHJmY9f0Ow6r0RCNwH5NYvVG2c3hgeCBSqJXrFHAiZOsnl87r7/sA/R9AiH7MmYlcCJzBWrMoDCmyDDw==@vger.kernel.org
X-Received: by 2002:a05:6402:e0b:b0:698:8847:e2f8 with SMTP id
 4fb4d7f45d1cf-6a38060c289mr3514415a12.15.1786635463470; Thu, 13 Aug 2026
 08:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:37:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiC6P4e823DQ+d8AVtkF2odC4u=0yKbhzbYOAZ0so3FA@mail.gmail.com>
X-Gm-Features: AUfX_mw9Lq34HFTp79cv_PvTry14Uxpoge8iTcoUGFPvOqN3X9bgBAm5PI-yr1U
Message-ID: <CAMuHMdXiC6P4e823DQ+d8AVtkF2odC4u=0yKbhzbYOAZ0so3FA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
