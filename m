Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4B2FD66D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462613; cv=none; b=LNhIkRXRGUrGh58Rg8ZBboIvMVlcLEB2ttPJwa0TasLMHH9pzSWgjkLINnUpElz/8yeFLJuxcrF8T/+v6hmfGxxyfN5pN8LkEs4IMw3pt2tJhiDKWDm1uAyaD7hLaadEU/Jb1VlH/GXVmChNgBvEuM5I0dWNczhv6VTrc0KNHgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462613; c=relaxed/simple;
	bh=68sbZorF7ZUm0ExdOttCQ5BW8eptQUms6MfXd/3EpZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NquiL2ZFo6Wlyng+GgWnwFWaWCqT9LRlrJfh48KQzjvy7vsHLJ5Ht1KfKE9rRhgQSuzhcDMlFStDTsP9ElNkH0FtU/GiWUwF9mmz5hRS1Beu1R1Gfl4FaCVBuR+82HJKPZNApmlZWVTVNTnl30F6tIEAfrAFFnxiqXZjZjzMS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so469460a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779462610; x=1780067410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VobxwKyXwVf7/v6vELiTgjzPLWWcLObJXZXp+P+9MFU=;
        b=IAq5yLU7ONsDEro835bZBKILvAX9IPWtNlQGHNSifkP/kzVnF7Ru1yj0PWYYjOYNqz
         tligdJhrxDD9n9BoEU/FCFKtAtYUEoYOQLk7SofGV+gUJutUDr1i0xF2GjIu3fDKJOrK
         pH8r1so7fpLGIKVNQ2yOHDt8glAc7fLrxo7mgkB3rFiRrmFHIgMmw3udUvU671JG2cmI
         VxYVLTFnfXuriGkOBubh4VeDvFOa9PFVQKua6Lb5HhrajgdN9YfoqAvH1Atdp7gguwUw
         aQNmh3wdwO32q8H9KafFh/twU67kpvEy/QBl7Zug0JU/E+GZ5L91WtKeyoOTH7R+1JQM
         LQrg==
X-Forwarded-Encrypted: i=1; AFNElJ+LYouQbtaLUVMLbsTlnyUK/WssG4UNJXN0+moH2kaNacPLnFatctfWQEwiOWJmT0x9eCyefZhnxbwu4S7hL4czYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEokVMohHdKfVSFgQJayWst8RSbKkFtNN4z/MqsD1W0y0AzXYK
	dYg9Ytd0cEcq96psffqLdK3nTCNZCN7g+6A20KSf3+Mlu4SwOgS5UkFNdwUtu+rUygw=
X-Gm-Gg: Acq92OFZ8MC4pjOLhwMhbldpz2b+K86LGRhxlYYU2UZmZfY4dCFxjXI/TUFuz9eB2sC
	H7N3fPXTCCbyf3L/XkX1CSGxMdMUkBhDIcWzeD4wCEvx9ZSU4FmxH/GzTS56iVNaxQy2ZzFFYHa
	OV2Uo+YWYrjhF9kkxhMaaMNbGahofPExc358MfnS1XTaCM4Os1CEuTMuqRxeMw0NPuzJTobIYjz
	UCDFbYvL46juclAB+fsLOooiIT0H2j7OH1Uo9Pq0T0uL0rWXZJ1lnIMBvM62wmT+0JjzI+n29et
	vmyosIjECLATQJInGb1gw2YxoTBR9TuFreEC6C281WK8NBTYGfsrX+axlxLgBYvyoSU4+vsrZoK
	abo5aIXSv+RPq8GRKnFInirxRxsxQ4h9i+WAzX2tiD8eJ9G2gaiz7ex8DuIhB73osDr6zHbDAR2
	sioHS6QSY/l92mN48HMxl3MAkDACT59ui4ji3ju2bMTrTB7WUYD+9rD9Owm9M5
X-Received: by 2002:a05:6402:530c:b0:672:8f26:8aad with SMTP id 4fb4d7f45d1cf-6889c441ddbmr2347783a12.9.1779462609924;
        Fri, 22 May 2026 08:10:09 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d287sm824341a12.6.2026.05.22.08.10.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:10:09 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-687d82dd690so367670a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:10:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8nnQcagdgOti+6u/FdFoZ7ysAUOZjvaxL1fscMwGCUrFCBDBi3W2RTo0hJxmOghSeinB2LdkkQhHwbwEmXSuIDyw==@vger.kernel.org
X-Received: by 2002:a05:6402:3907:b0:687:f18:c37f with SMTP id
 4fb4d7f45d1cf-6889cc6c63emr2128825a12.22.1779462609111; Fri, 22 May 2026
 08:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260501105116.33452-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260501105116.33452-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:09:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvRbDVJMoiS496-TS=COXQFQfdL2WYFgG5qyVCbbJmbQ@mail.gmail.com>
X-Gm-Features: AVHnY4KTJnZLA_ckNgwFXfBH1CtHwATlicdn_pWJ3THjZFjqa5CIIf_0krKqFOI
Message-ID: <CAMuHMdWvRbDVJMoiS496-TS=COXQFQfdL2WYFgG5qyVCbbJmbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 May 2026 at 12:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the PCIE1 slot available on the RZ/V2N EVK.
>
> Note, the PCIE_REFCLK comes from 5L35023B versa clock generator, once the
> support for this clock generator is added, the fixed clock node can be
> removed and can be replaced with a reference to the clock generator.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
