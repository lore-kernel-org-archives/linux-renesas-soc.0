Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8016F49A3C3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993907; cv=none; b=kwvz+3JSIbYmxAnbE5pbe6EEtutE54Lzkz862tCBxRWclYjJTjmjdv1kyRPj/1hgfcGaNBWDD3lO905QFGNGM7n0k16Gk7zRSWQn9Bk6NOOAkPTVZnOwJGuVPag3JCJswxDsTP5loWIX+g+JkPhGuyo4q4xS7llYuWLOFztXGr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993907; c=relaxed/simple;
	bh=SGvA9NKI3LhkUtgFg259g3mM1LRdIuBdN8zWX5kHUmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGZBcGwdniTSoEcQjbPBDVe+HwHnv9mvDz2gGeHUp5K4W8HHas6I5XMBVXSCMZpJoP6rV8zYSvyGdtaqECMulnvwAvotZEtCZEuCffYrAzO/4f1aj/L7rjnWy6DN+HMzZ3mLP/8DBmqi6v7QzGSQlpi2mTHBA8XFqdS4ID3wbjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso333273166b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 05:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993903; x=1790598703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIzJLq+3/3KF6yVvXrlV6434jsREi7AOdKjY7WjwTi8=;
        b=MAbHt9PLH6yOuFY/rBNdDvB0Mzanq8E2gBxJSkvNr5jezfW4UWuMvOh0CF2FQR5oyg
         nZGCF5qh4KZ/gdLpA/x2l3GWSU/z3Vo61UvqxytF4Mrj5G1qclBWvL5h6tar3Htdl4Md
         eMVPLbMxl/ll6CdcPu4e2Ux/gLtSe3vkXhbGDaMNuMwJT7/wUmkNbdOD7oHG0swVuKmx
         6u3rW9+hgf47Khxs3pr2jtDMfOqo5MZENT6Z+h/r29xWoUKP9agcyHGMPUJxuL+rXtP1
         xARrdUdZRDNmbscTGSF+YtH2cXkGZxAE0my9BX011JoHz9h15YkRI63oycCwY933E6f/
         WDyg==
X-Forwarded-Encrypted: i=1; AKwUvBxzHZ+G92RmRuRoJiqs3HuSZBEirr/BWxNOk/5S/3TPl3TmnTT/v9txL3u5nXhnj3RwlZ/ElHhl20WDBoY+XEl48Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lAm4U0ahkGwvPZDNAc6dB297zNr4n8Jq9ADvu7X+Qqa9sNZ6yG
	oko0A9VHYfT4jFxZzItxHkK4oT4AOZDfR11V6UnSV/I+B01yZBBXJ022FwQBLq+GuNE=
X-Gm-Gg: AYBFou32yOAM/7BJN2yMvFtp4PPb0na7w5vothJSa17ADbpn0fmmFZrbhCAqF6IHyPg
	ytmRWFHEMmrUIyMG3PBvmp8ri7F75EnL26/AqNspNXOA+KqRY/YJJQsyYa6FQeUqu8NtI3R2Itc
	mjO2g1PsJFGDHVsbeiWWH+bBw2j3i9kz9EGJNUCpk5cqqDM6vWCAbuoOcZSuc0YlG1LqqJBPfJm
	Zqm1+2YbLVG9gd0nRsxwZ+CTdI+Ykk/2ufijlK+aqeHUCojras9orI91qBHxlFCWg1n/chNVGWC
	h3QSEvJJPV3hsD/bwTBrACeIgyrXZk6OUDYJICW2oEz1hLYO1A3v4DNVbHKpVNbpSENpJrtgJge
	2F4yyLvMaDqJsn8uwF8sXwmcUyND/4ya4BVdZ8y4R0KitmIgzQOnZmpTZLpIuHPv10MIR8f1taC
	B4xBATrapLNejG68CMxAmoQ1iMgv/vNOYXXz5QhccZ1aSk+fQyXdIP/MmQoasEkoJbBg2ykf0P7
	NWOLnlx46xFME7bx8EJL7WJWesucfZ4EV8FRQ==
X-Received: by 2002:a17:907:a88b:b0:c26:2a5:819 with SMTP id a640c23a62f3a-c2a156d91a6mr899200966b.18.1789993903477;
        Mon, 21 Sep 2026 05:31:43 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355e84c2sm312696066b.12.2026.09.21.05.31.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:31:42 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so3793676a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 05:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVv7TpkOa/dQAKtbFVMWInsTSnJ+enzX5M9nsfbQ0Uaae5ifwtUwDObaqQNxIJJZHtTOlJ0NCqaDE+pvhk1OIIcQ==@vger.kernel.org
X-Received: by 2002:a17:907:3e02:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c2a1584621cmr808752466b.38.1789993900306; Mon, 21 Sep 2026
 05:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <arD_c9iP63WLOI1b@tom-desktop>
In-Reply-To: <arD_c9iP63WLOI1b@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 14:31:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
X-Gm-Features: AcwNN1X_gHFTAUEKRMyjIGa8lhYNHtyWicHqoXl3HQpq9G7xY0N2gFZj17u90js
Message-ID: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 21 Sept 2026 at 11:57, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 09, 2026 at 10:54:57AM +0200, Tommaso Merciai wrote:
> > This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
> > enables it on the RZ/G3E SMARK II board.
> >
> > Kind regards,
> > Tommaso
> >
> > v2->v3:
> >  - No changes just rebased on top of next-20260908.
> >
> > v1->v2:
> >  - Included PATCH v7 7/9 and PATCH v7 6/9 from
> >    v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
> >  - Drop placeholder patch
> >  - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
> >    Update commit body, and improved usb20_pins, usb21_pins comments.
> >
> > Biju Das (2):
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
> >
> > Tommaso Merciai (2):
> >   arm64: dts: renesas: r9a09g047: Add USB2.0 support
> >   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
>
> RZ/G3L USB2.0 binding patch is not queued.
> Shall I send a new version without RZ/G3L patches ie, using placeholders [1] ?

That might be a good idea, to unblock mainlining of RZ/G3E USB.

However, it looks like the only missing piece is DT bindings for
"renesas,r9a08g046-usbphy-ctrl"? How come we ended up with
a driver in linux-next without bindings?

> [1] https://lore.kernel.org/all/aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
