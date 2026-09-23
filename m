Received: from mail-vs2-f24.google.com (mail-vs2-f24.google.com [74.125.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020947F3B0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159637; cv=none; b=ZhDafUYIgEFMGvHIFpYIaFpk7FSGplg/Ie8+zP5iiD/zLe9RN3uKpZTQW2VBsWgr3TVcaHUPZyEl0EDgoKrt3wa1LKfv1oLD6FVGSpRqMDDY4kYY92Bn4zzMdFWbqIyXpmTpQBLxqULDhgcXrtZLQHWKWjc2xP9yNWICchGI4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159637; c=relaxed/simple;
	bh=6QiT+5Eti1IhGEvRyNE2dwG7QghpDhUduh0GYW+kW4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjyNo8V0XRdbPGaI8UMW2RAlqsAvh7o9oVaMWG2exxMKdlijl64jzyuZmOyPIoxUgtQJuuWKt31yi15imkqA/Iz0M55IDYn1DUj4Bux8f7dlh5lWXScU5b4Q6Vme47P5hLETL4azqC0wGE2/CVdq4BkIDuagi2A1SmnTirpOmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f24.google.com with SMTP id 71dfb90a1353d-5c97b28165bso776619e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159628; x=1790764428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YiOls8D0cbeW0kl5ScyFGGWv5xl1CQ8uKTuoQSqtSKM=;
        b=pi8azog7n4a9nyw4IidLFq5uv7soouVB9jWbU3zt1JQ9n8ZSmwzG0drs1xXWuxPYcE
         rqBmWvK7PKwlVp9Cm2/i6mo/mHoJEhP5L/TENGuw7hYCXKnG6HXZNAXYMak5JAf+4SmW
         sU3bVJduPxNf8kIpwQvncNcZskw+tcRIxybTfokWz60nzjCKcOZXzWEtY3UHb3LYPy0P
         Iiq1icaHBBAyGjc4NKAnXdvuyz2BPdN9NBkB9le1w4dgfNY4FFZiRZJNf2uISIwqYtQ9
         iIxZeR1K2+BU4sou1ff9Yk8Pw0zKeiT4AqJpvzfUMlpyp6WJnCWPRjRKmSQWpwWVUf5u
         oxMA==
X-Forwarded-Encrypted: i=1; AKwUvBytjLQIby+9epWsm+O2l9J+1Rks8pQS8YafjzEfoACR+rmmClVvXglKcIkaUFppxJ+tjhVr4WlAo+v7Ha8E7bHjtQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k1fQmL7m8KpzQy1ft5ubnQ/BEJGdwi38sLiA33JdObYWgEpEzp
	zWWr5NGq3WpjFguOgD9moAiL5yT+m8+e+athWYzh50I1tCU20vdzFuYb6GRMtGbTpnY=
X-Gm-Gg: AYBFou1ikjTOKHyUQh1amAOPaI02seKVd8Bu2n59m3cbcLddTSQ55EDeusXuTac5laW
	DpkJi45OYJ+CAyXmDWXxOu5ZrLcAm3cZuI8OSmXRh3uJmfbcDcHibkMDFwYIPJq5l7fzw4g1TxQ
	nYptCqdWfW3sJ4eQToNS7AFezfdg/S6c1NMIJ5S1Y+iCoDeIzmvf7Dy11SEPdDHD/MLWXzmYp9h
	7DNP6sXC8vXU5VWA8ZOYJI22zZunGWNTZmI+4trpK5rJd6Cy0rURuFpaCQTo6mqugAy8I2lEL9l
	awBOcTRpTmvjg3BLVrT1zEyFlIRADIGxElzT9fxiRnDDA0rr3a4J9J3s41HNu4XqqT0/KXE0d3l
	50+tYd/JsOWmmEfQFXMjROLx506d+FTuFzGmia4AR+ijnkvg/tPn6nRvnRUqvHaq40eHHLil/3C
	7g3Y92o6kMSAUAQxPEGJdpcmyH1TCbgFntXCMFr7N38aprZtIXByQ4js4YyiJip38vdokYRQadP
	9K/kbHOyF1S02KjrXhSS5ycjeQWC9hW5hwkoVubiZrWtOw=
X-Received: by 2002:a05:6102:c0a:b0:7a3:ff5b:ef2d with SMTP id ada2fe7eead31-7ac1d0cb7d0mr2013900137.24.1790159628315;
        Wed, 23 Sep 2026 03:33:48 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7966sm2776947e0c.2.2026.09.23.03.33.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:33:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7dcso329528137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8RPmoZmBh1zPxOEs+hVBShloE62LqzrrzfrrcFTiGX3Q8Ov52s3ZKKwFSAqXnv2/Szn8mISCY/EWvD9FgP92cFg==@vger.kernel.org
X-Received: by 2002:a05:6102:3712:b0:7a1:f7e2:aae1 with SMTP id
 ada2fe7eead31-7ac1d0ca801mr2003132137.19.1790159627332; Wed, 23 Sep 2026
 03:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:33:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
X-Gm-Features: AclHuK_hGN_yWlJ6BENm_qv3b3xlhGSBd5j_07ozn_vS55vMXA_7UHHfcE0Hj3o
Message-ID: <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> v1.3 SYSC, however it lacks the A2VC0 power area.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Added space before closing brace for `ca57-cpu1` area
> - Updated include path to SYSC dt-bindings
> - Added Reviewed-by tag

As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
Add r8a774a3 SYSC power domain definitions", I will provide a shared
branch with the dependency to Ulf.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
