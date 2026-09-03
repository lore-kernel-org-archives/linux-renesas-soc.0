Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8B36B93F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425559; cv=none; b=XSRNcjhXrS66uIdSAXB7az9d2eISM9Lt9tqmnvXFU+ESIkDUAWzpI+2KxNJyrw71L/Oer3Jw6v6aff1Z+JIczdDs4sqoG14bUqzfrLXdFPUqChFHzB36B0kFpNELV9Ylvn0v0HnPiBt3E08Ls+aw49AlhTl3u344fc6jJermvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425559; c=relaxed/simple;
	bh=nCjep19YpVy7ptXJy85uM8qZLDh2PaaoyCU7UFW2ucY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMtiBbOZHlSSctzpQuwO8CTPbMs6/CKq4SyaxDaj4Qis0RIRjfSWDwu3udnwNQHaOQmOk5b2d8Mj75g+8WMbDsF3tldXDxtDUb+RWJ9FUmAjDVSZqa3FKQQA3tw5GyDDBePUXhdt/J51SkcldHMQYg0v8A4uUItYQfAgqe3El3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97cc72fe0f3so477767241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 01:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425557; x=1789030357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4rlCOn37h5gJZpVKAKNeNVZ0qRLT1DFUGwUmbfCeTs=;
        b=UhkvrcTMHL2ZDYcA84vjm4ne2dhKmFaoOcmv7uIslrdyI9raBA4LkKnlW+Nw0/AZs6
         Ec91cTeIo+gQAKKO7tjZTl+9WZg01Xp0dBnUPo/9MBerQsYCv3kKxmb4SQFDo9EZlTYt
         OkjuZ1UBIYHX7bf3VOZW77V2Hn9hkqKjEp1c0O7MxLC8WJkpwGsp2IS8lbx+SmX8AiQt
         zzXBs8ojqSotOyVrtg57BbDCSqyM/EmZwbmK+AbjxZOUwYIqoBjMhqAZWHJ2Mntc+Qfv
         DC/OmqrkCgkivLGMg5l8yK1R/gtH4ilqeF+BaJZeh5QV/olGnNrNd0Rsausx+sexqPUi
         J4OA==
X-Forwarded-Encrypted: i=1; AKwUvBzubW+NlBO6/bf675NYWLiASv5GmRvfuIn1wfSclB1AEsCqB4zMAT11k1ovwlQ7Wp0x1OquQ3KvGsd/Aiz34HIOmA==@vger.kernel.org
X-Gm-Message-State: AFuF++loj3BDt3vc3iD/tkaIreuBj5VgAL2felyvdw9PTs5o5nZiyVLg
	yzQBQiXdG2TYP9NN1E4IKabITeCRYxj7px2fVLRs2LtRDhLnlxEOt7jPk+m4fTXee28=
X-Gm-Gg: AYBFou16ac7MMGfct8IRIOr94y/3FzSWk5THl3RImihUZ6oaWr8Xkomid0p8GxcokTx
	DjyrbSHVqwQeYVdYrM4b4H5uAgt9edlnxnLQt45cY8v/RqkF8MILOwno0PPouEcieA7GsEHNrkN
	tgenSxhEIaf2uJUqWxKVuOiOvui6tq5DYdVNSrGDMdQnKXB0Fny2zfynQkqJtufq5PGRYWxI1wX
	26onEPhoqdewYKZhXqMQ4PcvbaxFuFLb6TrAKD/gzdUhE4LkEawgiOp5/Nf7hTPleJtQzzKM2L/
	Od0gazC7YHd/1G0tGCzm0UDwGonfmyvknhjvtrSOYqPeQU2k1PO8Mn4kjpkwARg8HGA5xyovWtE
	ToIya6lavK8oHX/pMUmn5/GinGxXhTrcYOJHK0+OopyWeuk1P9VWiXEzjKxboBZx58SeeZxYovn
	5xQXfqvHc3mv1BhU4xhfrz0b3nN1q8EW4X16erEAdlfI/Vs/Suxa8PpMm+skMZqxFQ69DcrDJBn
	aR0YjZGbLbJaKXPRjaSbEaBPA==
X-Received: by 2002:a05:6102:5493:b0:779:328:8a2e with SMTP id ada2fe7eead31-78a2ef01223mr977770137.5.1788425556787;
        Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a2552edsm4232061137.5.2026.09.03.01.52.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so609655241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1gkCzNwKM8J3pVIGCMMK/NHJ9zvotJSAjosGmzWuA+gxMb0CStz4a3CCJhTTPCvlyAhq/57KY0ospXBLfBMjNsg==@vger.kernel.org
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id
 ada2fe7eead31-78a2efc74e0mr951843137.15.1788425555897; Thu, 03 Sep 2026
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <aob6pW_BQbW_hF2e@ninjato> <aovmzeyXAQtb063B@ninjato>
In-Reply-To: <aovmzeyXAQtb063B@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 10:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
X-Gm-Features: AcwNN1V03wVoMTHnfOLNCqV0N8TGrKgNMWk4P9bpEKw35T0AC3SEfctOY_5pVKE
Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 24 Aug 2026 at 08:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Aug 20, 2026 at 03:01:25PM +0200, Wolfram Sang wrote:
> >
> > > Changes in v5:
> >
> > Tested with my G3S + I3C setup. I3C still works, I could also not find
> > any other pinctrl related regression with basic testing.
> >
> > For the series:
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I'll reply individually again because patchwork doesn't pick it up like
> this.

That's why we use b4, right? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
