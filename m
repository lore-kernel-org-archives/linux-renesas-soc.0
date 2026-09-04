Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002D446855
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516749; cv=none; b=eUZ3uzfCIpAfhKZg5YxlDtuor0QjRbkKLkMp94kageHvhDodZdXmNsVjlbXtXlqcHSdB+dFG2xgCCAsKuq9cCmr1WG6Z7ssK2fnc3m93xuR8TiPVdiaeZOX2+YF6YPr7/4hrQlJCpwT4GSuVfQRDnguAFtckmFVozTktrbJ95jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516749; c=relaxed/simple;
	bh=QkrSEynGau1ZbI201+0Em8TncEc13fHHUvNMrEc6cck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZ3IQ4h/4/UzCztWs22o79khl5U4/BOT1QV0PyEjKV6wA5OxhSIR891J2RzTWYTtN2kbVOprv26DYxcbzL8yS6pzfxQYeejAB7NI8Sd0M5TR5wZakqzkA40DE9P0Z07lp3L26fBsQixleYiJ1E4quQgT0+vCIwYkY41qecfYLF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so290304137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 03:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516746; x=1789121546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ZpJN9RlZp1CfHTyya0RqETx9peOqUoR2+FiCTsKgE=;
        b=MXNEjC06RZb5SdxnUkS/m0Yk2lkDf+YaS+nW0gtzqlq3yksjvadhfxWQzB/aTk5NGV
         3ISQXnZWJeD98EDgB7NetfDwveFd/LdWv62k8qwjNwT0SuJiqYZfVI+We5SS/+WNAF0M
         E1zZpjJ9Y033idDlCbulowrABOG4ZsvMaqQaEpW7NxWTUEa8okqtncS9HFSwN30UHoY/
         oANPH6u4voQSzk7TC4L1Plt7UGKIRhA61HPagtIgAuwb58JfCY0sNsRYMa4QqR+OC4OU
         tZBECe/HPyKXsosyBheP8Of1a1qjCcn74evUlP4HKygRkWtpPbKMHSH37NdFIOgjR7Vz
         nCug==
X-Forwarded-Encrypted: i=1; AKwUvByPTuQ8vOAngWE4hWM4McvWzXILjrQvtqBeQo+JozPvl5HN27JPVwq/qSVVbpWhXN8Z8G2Ajd/NyHOuMmMXZuq4Ow==@vger.kernel.org
X-Gm-Message-State: AFuF++kLdpjq3OFvKbj6EK+uzfzjWVnfQ+yZF1f1M88BnMLXPrp7Moij
	GGC2Bc+IxW6TCF43n4yRf6FKWoHtlg47TcVyj+99yDO0MQoa2plwFlTELOCBGon8Nh0=
X-Gm-Gg: AYBFou2Y2Q3QPzxjl2dTSC19jyHgtqB4jjwYjhO5fVGpkjTrIMaiyLk56Ltfom2mkFY
	ubXtHNl1XBxSc9bTnBWGDCuFXR2PvNwJgj8GofTWfScr6GXDSS9ruYLlmv06AyPxWWwgIMOXd3t
	xJZYW5EzYrQZlSfWDPx6vb+BocSWTbo9DjGUZHJ1qXtNFOuH1ibqqmn3/OMNcLKu93wCUNXenXE
	hDzCggh5ZMj/uSeE7oY0gtXK/thamRoLB1neh2If6qTBjhAzRI2dUfHTjIa+PckYPIR+Oq8ww0p
	rLfuRPWXZz1YyOo9Qc9Sehtqsv1eQ3lvPRtzgFz52SUUggmeKPbgpbk5KkM7GjQ/rhlZ6cRnxs1
	bi6BNLpikgBPPct2W4YHzVatRl/ayR3GKfDoEPvGP+RHBguyZ/9wkjOQz32+O2ipDvvseTrJgL9
	xT/vLSM+L5Q/thfPEZ+qKL9MPYAmLR5H3zC3Mrak2hHFiG7rcF7u4E3Jc0C5mQmGJ5z7tzumtpr
	MtDVqyqBN1rVbB6Z/3P25x+P+PbXXrYfo1SOQ==
X-Received: by 2002:a05:6102:4bc7:b0:77a:3431:669f with SMTP id ada2fe7eead31-78a4a66d780mr1276471137.7.1788516746487;
        Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b32678sm1465944137.10.2026.09.04.03.12.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so290296137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 03:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjq8kjN0t73LKSWxmizEhcOuz6XPEUeO0AkxaJrgTyCn3UwEW9SVSsXgEsbFqKmBFoOf+WRQxKlpak/vT15UzrWA==@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1286425137.10.1788516746128; Fri, 04 Sep 2026
 03:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
In-Reply-To: <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 12:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
X-Gm-Features: AcwNN1V1Us7DEfFHRItLM1ZA7SwiTD-ZOtpiiIkRmjTu4wyeWXgopaPPPq_n9t4
Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> > On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.com=
> wrote:
> >> The list of allowed pinconf properties already includes input-enable,
> >> but has omitted input-disable.
> >>
> >> Both refer to the same hardware property, setting and clearing input-e=
nable.
> >>
> >> Add input-disable to the list.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > (...)
> >> +        input-disable: true
> > The Subject of this patch is  "Allow input-enable pinconf".
> >
> > But what you are doing is allowing input-disable.
> >
> > With the subject fixed:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> Thanks!
> I'll fix the subject ... !
>
> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pincon=
f")

No need to resend, I will fix this while applying
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

I will also add "output-disable", which is missing, too.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
