Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292093D25CC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593416; cv=none; b=T1N31XXpLg4zURQYXIOqtQ61JAw2PFDoc01aUkuQCOCTcxO91F1lHx4B0qMoTyzgrbQOxOi4zsZw+aK34eg5xzmjqfXG6ZM1OLDIIK79O4YxwGbbfWcRQjMAmm4qJSrQ6Mw2Xxp2gs6oF2r0JzTYNcSy+6vWKeH1oYDS270iQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593416; c=relaxed/simple;
	bh=4CIPkQb4KkhTWhyWxYY18u//D5r796JDgZpLE+nZYNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LodbNP+PqNvaY0QE50UDquk/qh0lnyBSNN+FUdne6VoW+77ROTYqYB1zv+bpqTsZ/vSxuE52W6jQkTOOSVbKuSmr+48kiBhLUH1txoJSifldCyAMvPZvs8qFVCiyom3+ow7GzxYDyj3mvpMdxsqfDEhKJXdGMW15r+6wgK5Z69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-738f3419eedso458097137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 03:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593414; x=1784198214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=52Mzwh5zuD3pl6tySjFoedOc+SKNqyM0wWZqkOZl5UQ=;
        b=EciuK06x1soILYy0uWxxFsdqUW39dDCTwK1mTeuGgzuTSgrQCdXMLEJu67zemm1L+c
         tvBZ8ZoVoOVso7rrqIekEjJO9yYDfN7v4ihtJdSFS6wvn+5vfxkCTSYQoAJDFqC9HGB+
         +tSMHLuphTkRbVdFIRooEdYzDdWIomG0sh+1yjYegb0oWAvJdxhk1kWL1UetSzwQuecw
         EMQvFtpEdn5PI4gFiPmOt38oUd0wixHBfrS670QPu26ycL9JxBYKyR6nVPTeHkPKqoLt
         mYQVZQ/C1vnp+ZnmylZM0pii+wo5K1GYzkfQwGD+4QuYLALpIKRENkWPHUvydn1eR/fu
         Jl8w==
X-Forwarded-Encrypted: i=1; AHgh+RpzAJDh5WIu2oj+HUaLvNvPqTlJw85UuAaA1JYya3E1roTCn3M2wRMV5NCwuQOyBOCKkvcnPhPGRvYyeLDNP08F+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsD9wJhKeVGm/wMWKkNQJ2jGcidCi1cMedii/MiLXGV6dvlFx
	ofr24CZClHzm6GgP4WHGRjU1JgqesXmmyiv46kH9gnhYZaMzovxh2uYUxv71iHYqmas=
X-Gm-Gg: AfdE7cnT/Wu3jDR+NaML4XPMFpR2+kOC1eFP0kbaXaLG57/Y8ygLelsB8S09ZwbeONO
	y60mhR4pLYv26lZwczgQjRPZy6Nf+PgB7Po+DVQeZuOcIqhlmVfrHEGjwCAUI6wn4Onf6qPw1DY
	ZSYsiDepkd3wpVh7xX5DvEcRCiCX9AeuPyVxPWFfuf86kwbcWGXkquoQ/FiEMHPbqw7aRmzLhbt
	sICYqoao9XOLIBk+Bz0TYcnb8LRWITsBPZYWnvSAFGnDp2nycj7OUrsSIEbYolCNDyUkWPkda5f
	vZ7R7OHowM8pg9CdpeDukpWgfDVTQqgEZ7K2TIVLGD9UHoPs22bSw6kyFTCkbtP1syBk6Sn1NM+
	wBbXQe/3yCHSxFAvTGWjyE2BlKBeCH58q61EXWrLRlHk0ewMG5WKH2U263zF4BOWAq2lgNRPZwc
	6rBQ3lUVljJ9033rSj+ie0sbzg+tkRbZJEi0MBo9JmlUnt2CvKHQ==
X-Received: by 2002:a05:6102:3e25:b0:737:dbc6:3ef5 with SMTP id ada2fe7eead31-744e01dff95mr3620750137.28.1783593413960;
        Thu, 09 Jul 2026 03:36:53 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a90d4fsm3307449137.5.2026.07.09.03.36.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:36:52 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73915ff1d64so457847137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 03:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp4OAyD7c1RN09Ad9PBm2+fPXB3/u8aDVo7jVFja5X8mY3InKZUEkjqTtvVP+aLXpP9+i7WLYMk2bnnwlN5EKSwoA==@vger.kernel.org
X-Received: by 2002:a05:6102:290a:b0:739:adba:f27c with SMTP id
 ada2fe7eead31-744e00f5e2fmr3715156137.20.1783593411950; Thu, 09 Jul 2026
 03:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709023048.599150-1-panchuang@vivo.com> <20260709023048.599150-15-panchuang@vivo.com>
In-Reply-To: <20260709023048.599150-15-panchuang@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:36:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhbufoj4PMBN4jZqBhvrVVkNP86By7vcjEjiDRRGz_Og@mail.gmail.com>
X-Gm-Features: AUfX_myNXBXKGEc9hKQlW5AX1iVW4ix7pcbGGCDTwzpx-MfG5CyqtA2qNt_vs9E
Message-ID: <CAMuHMdWhbufoj4PMBN4jZqBhvrVVkNP86By7vcjEjiDRRGz_Og@mail.gmail.com>
Subject: Re: [PATCH 14/18] thermal/drivers/renesas: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, John Madieu <john.madieu.xa@bp.renesas.com>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 at 04:32, Pan Chuang <panchuang@vivo.com> wrote:
> The devm_request_threaded_irq() now automatically logs detailed error
> messages on failure. This eliminates the need for driver-specific
> dev_err() calls that previously printed generic messages.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
