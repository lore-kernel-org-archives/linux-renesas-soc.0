Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FA33E7BCA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520296; cv=none; b=eb9jnrIY56yr66pWNmsvqEnv8x4kNJH/9HF1ODaeehU+vuLtK1pTLFYxJVgvAfQ6rEic2cPXxas6P/yKFvvG6kS8UfO8IiNuJQ9aMVSxwWqpC12OrX2T6w9ZBZsBIgyl4bLypq4QMtSeKIZ/pQ6hGv8U6Tpxf4/qYL9gN9Cj0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520296; c=relaxed/simple;
	bh=kogY6TLSuVIt/3sC1dBhtpJjb2uFidHomRE45bNUWKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq/GcEHkCmTvkViv3FEmGRypPNyfA4vxQN37+5msFzLAFbgz+OTeEspbPOl1ogtprU5jLRGsuu6BnRZftZIBlPhwqxrRQwYrACV+0pDd9bzxAa9eLw8+ikxlS5sX+Zo1vMMtWWRipNXg7pArfMMJweuHOjK7/AJ9w1UNXciZlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so817851e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520292; x=1789125092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEMMEYg5UPRjTvJH6bpCIIVqiRbyQhNHEX2ipUmBsbM=;
        b=s89T0xynbGSHwEdATzGWyj0vJ8/Au8qqBIyh5tGprbut8ZgUUZDPfc0x1YxVOHEksz
         kImmWvSq/+FOOI0JkK5+V3SFb+tm+HL3UfqoTTQJZxEX+wA1M9A46u9gq+ZfNK/rwjDI
         cL7UdBL74hVBrjlpyADUYRoPp7KbQKfZZVqgET+KHqCm8DgYtZhcDAQSdwMGxvzQNeW2
         sxMRrcnGNzhdiy3L8eYS87B3Kp+E8V2zlmimVuzSXhpIM2AmSISBpNj81Jayhzo+M3f/
         ErLvN8u2U7dvcOMAe14nL1m4Gx0/e36rXVQGUabAwRUF238mLqRAHZbzmUGfqJMVWtne
         6ZBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyy4o9LnjT3SZQWC0ZKStUgfMRu9rD+TxsUxLsLVI086ond1ALzL0nQVO7XJy+Pk395zEYBaGeX4fP0jOR4zbUuw==@vger.kernel.org
X-Gm-Message-State: AFuF++nD6/EDgPXLrzRi57R1JAmuCaBFUt750Ef1MtL8YN5vmglEwz8M
	SqFukikfSSVlBvXvHaTLthzR2z9tgNfRebUxNMtuXmOo9wC7KibHovPTznfZ7fzepY4=
X-Gm-Gg: AYBFou3cPZcGPPl0C2/nhnL1G+jiIvUvvLhdNFuAyUZuTGGI6uLytyW/hfwLKwOCRFo
	xs299N4OE/RLfWFc4Kw4NisQzbjuJWOxF4ZMVozoRqAYhNKjwJ1jymkFpoEN/GPkPADVXq4TKGv
	deGm0pqOkdxkKH4G4USe8TmuwiCdRPTXEJRxXAhc2+bd82zMGqissLU0ii51l2NstPDgvigePb1
	z9R9jf7bswj2pT5k6C5iBAjrEDSJgADaciHuwcwrGvGp1FTSSdtBFiqvpP6kqP7luZlGFOPgg3w
	kld9r2h/2oC7sUdPnqRz+ezp4vxK1ALqCmQBhPWfF2hTF3EozXyJJNL3TKk+5dk+nxr7EQNPfVo
	Du6KtdnHvEQ0jzaI76NVnomwjpPNEXHK3w4SqZPF1m1ra2npL+5DQrRbaplTkKnvBDRSfRPjRVi
	SgdITJaQopIn0FZ0wtJVMzAMR8RE6H+1un116pLcBArL6ZtXRZxPVVwi++diN3TXQMkO5aJjpuS
	g56z8+41AvHsH2WqkyyeCWocqpk9GMJTlr8weSCPyJ1fFwU
X-Received: by 2002:a05:6122:da0:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c7ed485cdemr2166094e0c.1.1788520292512;
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm1780911e0c.13.2026.09.04.04.11.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-779d18ef706so639021137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhRpp6bESIVR48/939gJ8HhZrWhqdsec2OBp9OKxMOQrX4WxNlTw99P6WYg6/bjvKyjkozqwlxCEOJ11MsEpUN8g==@vger.kernel.org
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id
 ada2fe7eead31-78a4a6e83e9mr2237001137.2.1788520291864; Fri, 04 Sep 2026
 04:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:11:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
X-Gm-Features: AcwNN1VWCzUARGrrpc_Qo6UxK-PAKa2dMGWtQC_aDHn_mP1ls1EOnA4D533OdMw
Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car
 X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
