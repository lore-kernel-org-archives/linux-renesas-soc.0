Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8C34AE12B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872728; cv=none; b=S96yrbE5t13CnRmc1WPGx0Pn0dVehIG/WozsdEEnAEzuu89YPKKqoryGm5+skJBPtoSImkxQKiH1N4TA5fpzgonJXwDQrBf1Z+IDEQ+zhZKQ+XCeuDZKoMImz8VuHoNJGxa7W6maG7bZLsOol3EpBBmuw1B1vtFF1ss587qiL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872728; c=relaxed/simple;
	bh=cnqNBx8pq7Z47YAsS+IDwbUQ3pdA9qA5zGP53d/4bZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiE+Dly/DEzV0p+PZyjcAWWqW42trz37mxw75DYF7gcBcZGoBCwXylcFLnsmnsmBgz86Og5EFadEHpw84E3CqU7z6SFmHxBiYVwyWDdRC4FfMNuj5A7myWy+qM4Bhd8tdfZC2kOcZ52IPrKnyE/aLiltDB0OuwLyWjtPHK46R8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1257102241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872726; x=1789477526;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UFrVrNftIwevd1khEgO+DGb0fuGh52ZtRr2k3KbdQ18=;
        b=pdwec0E2PVM2dr+3oH3sTakAT96rgIXq85fqcg0sTpcxQL/L1tPKSrf6kaS8vU4T2t
         2ueBizEo+HuC6xOkDCv2mMH5rSrNxmzZ23N8+x6CPjlkTTKNj2LGibgic4iet5CgSYMI
         Phrku+E6+/OwiZTqfvoT8uYhyG/K8cXaqod6wyAEQGEy7mWPAeUzTLR+aNFmv8I9Auah
         PFW/hN018LIle73bEg+RQ3BmFIIdpzXVt5DSxsXmoKCnF5lxpt/EPuOby/pjEn/foPlh
         WNOQusArCtiy0jDh1J8n4bU1A7IzvrMwr57l22365q76YMhBw+WRC6bysDESsQ3CAj0y
         0qpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiWzuFhI4sOLocxoc0oUf6AIx9/HsmwYKdS+hfFNyVwSoRWJA39+wNUwsm59jf5ViZDINid9XR3uPAQ4Gr9/uJ9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l3JsS1qr/19Gjy+W0FtsOFmnvtioFtS8wCwy7mEI/PUzUawNQQ
	JRBQcp9awxbBGtHD2eNtelTBHuvsMLKpRTPm/vtN0W2ucTYcCzEL2esEixn1LLYB
X-Gm-Gg: AYBFou0aopWZUS70/2DP9t0/k5ksRV1azEksvrHtzybL39Eh4P8GDg502pYWQ0DsIIs
	9hw8PNkcoEehzx7F/4MHISJsEbh/ft72Ij8dysM3sSJggcGAN9P8OCF/aW5u4/nyBRVFSpcWCdY
	JdX3BXmCrQbg03tyoW/ol5A8HgQLFLp9SEsuMiEMrkO9KwXFvJ1HoHcd0Ca9wM4LqPzdKlnfh/R
	cbrLYLcrESlt/CNbZW1B+35VRNECq2sNniit/85/oRktodjUerToRdcsP8+YzUXTd9x6g9QGnDj
	taaAH0JaOflhS4bBfQ228cE1h3DS8OlrJA8F0d1nHKnMeNGKJ2nukKTWZJRVvCeInZNSMGN49oz
	ZYsIvoSCGIl9/sOx6rtesBa/m4rNaVx3c0/ij9lHq3MsnyPRjYmvoST6HFbvvnUDPzTZzPJKUcI
	ulpuWL9vxFINfq1VL42EYND2YMMDurz1Gpb0UJ3Mjm2hnT5cNNUa4Q8hd0Bz6EsGs8DkNuActh2
	W23EOCtfALI254E6bYH68eJfQ==
X-Received: by 2002:a05:6122:340a:b0:5bf:6bf4:b215 with SMTP id 71dfb90a1353d-5c7ed29e8bamr13824493e0c.2.1788872725918;
        Tue, 08 Sep 2026 06:05:25 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm9345476241.13.2026.09.08.06.05.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:25 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1257068241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqyljkwKT8f+zDNIcgtAzxY9KkG+RID/SvTVz2N7hJkkwFy4gO6qsRP+E2tk+kcEAa9R5L1c+SJ5UwuJzfCCJwQA==@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:5c2:c0ae:a2e8 with SMTP id
 71dfb90a1353d-5c7ed493f50mr13555766e0c.7.1788872723498; Tue, 08 Sep 2026
 06:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:05:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi5+XYET9s2M6Wof+3A==ncJBB406HQuRMAY0mzYzObw@mail.gmail.com>
X-Gm-Features: AcwNN1X6mMBGvrXg-PhR8OjhDtaY51dYTpCkmLNbl4YY1ESwbdemVH7kSJCVa_Y
Message-ID: <CAMuHMdUi5+XYET9s2M6Wof+3A==ncJBB406HQuRMAY0mzYzObw@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] arm64: dts: renesas: r9a08g046: Add LVDS node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add LVDS node to RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with resets moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
