Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28415427F9C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661062; cv=none; b=RdqsC/wquOm4xuP+2Z2rArN5y+qIDRvzwzj4CGA2NDkTBzGNYjVbUxbIkzKk4l4GT2QA+/MMA6WLJIdTdgZkgTj1KDIFTMidRujb72jbmX8aLaLdIe2QLObiEVqrEFRFMHtI4Q+EYZggC6eYECNLlPWSB46NXkyU2/84lq7ouQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661062; c=relaxed/simple;
	bh=XVZs/xqSmR+34+BrwmpxC0cd+dGU1Zxb/J9zlN0cTU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3kryPwzQYP6e/P2+6hC9RPfcykKFfKqmnslTOZC8COvq+omPPAKZfVOrcteSGdd4IG+GyeZv2mV5gW2YAkBl4uvtZPuvFcZ/HlzC9E58Qs/e0SuLczgRkJ6oxshxRXHv5S5ED8xAVmMKgj6Gw8CxV6dMefUnj+ylJtPwSFf7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so2112851e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661051; x=1788265851;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ILP07iJKBmCL4umuQJDRJxi/o8MvR2u5/1eDo+tc9XU=;
        b=XSKeF7GbnOwsqW0Dt+wxPoo0oR2MZq9oD8Bqdj4iEzD2XJQ5WBLbIMx19aI/g1nrF1
         wS5qgof1DEGePO5Xrb97mXUFAMabMJq1Vb4Dm0nrpK4qBbJ6jtOyHvfL/ayk/1YOC1KT
         /tBuPpaRSz+QA+pcSWNnha3Tf0FnATZx7xdoRRATNrqmvkqKKnu41R9ifdi2VY3dmZMN
         jAxA1ZZPwK3s6dJQrMtbawmIH3FebKIKSQAMr7IWrmZadZJ0wa0Z/QkQeMV7/2tgwzBm
         k9d3u5LwBXq1gjk7owqRjqKFLnEs0PbMKUFt9m1DwlKkBnqAkizVam0teKnhicDOsvb3
         p0Lg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/8U8PYPVC8l5Ztj0XZAoKhFa/cIyCEsssNaFGhZYM7mItL3Q73p8NtZt5ykUOWHESDFVCwyfu+BpOIqVTFz+s+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kp0aLQCS4C7uh6dfpgl+KVmW4OJOLfcSOK0OEJmdLvUI1h6rRi
	/LpUsp0GqkH/USN9irfsZvfAU9hdyvBWYUwXqT64Sws58+xkPw9GjWN5VkOiofu+9Us=
X-Gm-Gg: AR+sD107Seajcu6i5h6og24oRdPPp0Ej1M1MElbmnrxVJ+ZeRnKgRDoqAzXVD/iDbsr
	6r9idCDwWpydyi1PGF5LuTODe17n0abmwvdtfwnnRuk5Pect8KIETYu71coizXxXpcT4qzyUd7C
	78IVtL1XBG/fhI6oL1SMthB75rc0vw1iYdNn2EkRLb61znfgkCkMACD8wQnUTgED/WSqniRstG3
	p166RLSALwoFIv8nV6Y4ea4eR802K15Lmk82J0dL04rXHhgzKh58zqOkXZViknCvwFeYCZn1iHo
	TcnVRdo2S4FpfNaQ3pwYHgqyUnA8oROKf7tOHTLQcevQ64wuGb2VfQlYX0J+hcBRSm1Az3sNlio
	wcFAIkmCVHxRpDGle68+JhS9ZOhAf1cT/AYmiYVfmj9HsbbTmmIjSDU/gy7yylucC97Ymdq5PO0
	8WnyJhD/rt8Y3vdY/MpAfw6wk3BNFutW9w6oSkTj+kUoJa+3XMQdj8IllVm4mIqAofHRKEK14GL
	tyvIJsa2IkwN62pTF9X6vfWTKd/PN1UBxis
X-Received: by 2002:a05:6122:daa:b0:5c2:b001:db5b with SMTP id 71dfb90a1353d-5c5ff6fd04cmr14589707e0c.6.1787661051487;
        Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623eb64f8sm6140573e0c.12.2026.08.25.05.30.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so1190088241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMLGGyli2x8dNK1D6//9nCSvW/YNa+xj3JYuGXSNoM75jbxXBBsp9HOs3hS8U3Sz5I0hIt2s84vJZ9lsGuZjYbrQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5107:b0:778:4c28:6725 with SMTP id
 ada2fe7eead31-77a6434bfc4mr9788298137.10.1787661050975; Tue, 25 Aug 2026
 05:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:30:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO8ARCZtT7m+bndN5szyzRxPwQmZ-GKQ+ho+yLgTH0bw@mail.gmail.com>
X-Gm-Features: AcwNN1XXro5QQ7iyl-KmnWQpVLzoicJmI0T4QyJFnTkTZ2UbLlORJ3tn7mvhDjA
Message-ID: <CAMuHMdWO8ARCZtT7m+bndN5szyzRxPwQmZ-GKQ+ho+yLgTH0bw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR
 syscon for WDTDCR access
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The WDTDCR registers for wdt0-wdt5 reside in the second register region of
> the CPG/MSSR block. This multi-function block is now exposed via a unified
> syscon regmap interface.
>
> Replace the direct mapping of the individual WDTDCR registers with the
> new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
> node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
