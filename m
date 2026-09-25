Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315B411A0B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325563; cv=none; b=RSz0mSnNRHyoZ/WKMV2T+SLmiZlB0k9pevLi2CBbD0U/IRy/Un2xsKskXqiNPfSO3H6hKzLnCCMmX7Y/ZyGgrtuXDg34fnDh1HUa2J4SR4tyjIM427Z9k3DhdqebeNTQjSxo/MHGt33taNBJbqJIkU7cad9TyuzlF2g+xRy8Fr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325563; c=relaxed/simple;
	bh=sLjamdMC2r3ak5IIhBPpuYPA4pO+dRlAi55DTGWziVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKf81lc9brhdxwafi6fyhj+yeGtxN0ZMcHR42KI2qmk0+44szT9heUv1IRUyQDJctqxFQMErUemU7C8aMzn+JsLVNwFZS3N6843JMGYxaPBPy2JJAxx9vhvmCnmYsy9/PDlfyh+jfycWZxflD/I+taw7BaXFSLX/PXIaKnA0kOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5caec6d2983so503845e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 01:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325561; x=1790930361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFBfiwCenTJuFLJhWULpwFEhb/dZKIf7325w6H1c1yE=;
        b=jOW8x8AC1RST/09EInteCT+b/tRnEBLSqOtJPvjX2+L+OdOJjqwVDyV4Dby0hrguDh
         667I5ay/8F3sFqEUGNfRmCmGDqVAzwPVw06LCTXa+5nQBuQuoEcZ3Y9ikVGK3Xf4eFvW
         UYuL6JaPcPwgRd0CtEE0VnHXbhTphSCoP6b9ud+TXCf31gZZN+Icnud32UJqQN853MM4
         1PHgjAqnqS/knRM+VwZdWQHGFnv4Bo9R0Rdk3cS1q31UCGiIFwlwZqDPICpK/jc94ufZ
         y+/i13H02zoJTnHXOAk777V218ZGEBG0cdFpkoElZoI0Ccd83/GK28FJg1Ilp7yuEqfK
         NcvA==
X-Forwarded-Encrypted: i=1; AKwUvBxtwqlbJIzCOoy6KKei3ofs4rDxWt0wj378NM92OlWT9C2aGMq6E/+ic1K+0dVGIM2T834Tthpjg/D+bWTLXbs08Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kJM1XyqUvTvlGISuktpeKxysXjkmFFmeXaQK2MLksCeVN65Ebt
	uhX5GGnFNwVRSovYd5Z+msDByZsV1qlPFFFA6H/1hVAd/t7aDuLjWJRt7rrm3rT5
X-Gm-Gg: AYBFou0o7EtHQqiig825N69xLuL163kNwlpN2cTGP3RxR2s5vGFDSkX/cJcYuJCjJU/
	R6gK2N1VLymySIWFgbdbNNM7HG6jqIOGR1LOFOPmuXiObvpU/5EcluyCQH7kJxbNnXaoe2NMjQn
	0rLxiVVQErLPlcBPvffovMm2k1TCFLL17AWivfzxClTAQUUEAdqf+0CBpWxDFAKkYoR96r+Q4VZ
	VmqqQ+XS6TYJ80dCcpz5TSwuMkvQmrBZH9TgxLpG6+13peWOT9BiFlmNMF/gKFjM50tkEvkHjgp
	gSLbKtKqzz5xSkWeJbkGRZ+qHEjU2U5if7V0TuWosFsr4ezt11s1carlF3qRT3Kc4xlYj9uI7cU
	So0uGyJ92ytmc0AxGzGXjG4r8JNyFp5gLnxrYAeds2M7Tb8EZsGRk8b4mOOL0xXaj04h0zID6qn
	Vyr5tfxkzAHnScFfcdb/4e40/zzLp8C2rExeEqql9p7xszRdC6QOCKpqYSA2ZrQKoIydW+bzkBw
	WcbyLKTivhjAmj0ALUJbFHt+rZ4gBPypAPAUsE=
X-Received: by 2002:a05:6122:50d:b0:5c9:a60b:e5aa with SMTP id 71dfb90a1353d-5cb0b48dca8mr2775585e0c.12.1790325560896;
        Fri, 25 Sep 2026 01:39:20 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc65d66efesm1824660e0c.17.2026.09.25.01.39.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:39:20 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so353411241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 01:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwf21S9nN64OilyYYx9DgwSia5/dCNY1PPB+vOwgytFfjUkQ70R356KHdzGSPmVVnEg6l96n+KlhxmP7Ig0g9VIMg==@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id
 ada2fe7eead31-7af1c79966cmr2662746137.7.1790325559708; Fri, 25 Sep 2026
 01:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925082134.146015-1-biju.das.jz@bp.renesas.com> <20260925082134.146015-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260925082134.146015-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 10:39:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxtw5-AEMfGxMLVAL7RPY5Gy6VQC-3TdD3Ydr=oc6n+w@mail.gmail.com>
X-Gm-Features: AclHuK_EqT9YgEVg0rKL_WGjxUVTb3OgvMn1hx32s9Yf0cSbz6LpWhtNAKIKLCY
Message-ID: <CAMuHMdXxtw5-AEMfGxMLVAL7RPY5Gy6VQC-3TdD3Ydr=oc6n+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] can: rcar_canfd: Derive max_channels from the
 device tree
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tu Nguyen <tu.nguyen.xg@renesas.com>, linux-can@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 10:22, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The maximum number of channels is currently hardcoded per SoC in
> struct rcar_canfd_hw_info. Since the DT describes the channels as
> child nodes of the controller, the count can be obtained at probe time
> with of_get_child_count() instead.
>
> Drop max_channels from struct rcar_canfd_hw_info and store the value
> in struct rcar_canfd_global, so it no longer needs to be maintained
> for each SoC variant. Update all for_each_set_bit() users over
> channels_mask to use gpriv->max_channels.
>
> No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added check against RCANFD_NUM_CHANNELS, to avoid overrunning the
>    fixed-size rcar_canfd_global.ch[] and transceivers[] arrays.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
