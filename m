Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB210516160
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166467; cv=none; b=VmPPrqSGi1OiYFZhaWL5oIqDwfJcYxmBeV/rAbomEVNG4X+j/ETogSEvnNIVe+gFdaCAfHIqrxbidLyVSOFj/jFpnVychwWLHnJ/ydRMbjZrEbU+LgzjBVi1kF6Dw75gtMYxTp+0jRQc/xU/34Cnpvf8ZNfgNth6/MS3oIR6uBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166467; c=relaxed/simple;
	bh=iB1X6yc9MU3O6Kpid7OWc6ghPs6cxaK0vVaYt7GQq78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI6oiMIbXgOUH/H6P7zOjdXsXJ/xi31el2CGEVvSxO/aEj+VIrrUr7rHlp7KcE81fLKDkmX133fPV6NM5c7tBXzdo2FpD6JpjWeAU+YNZ5sOYnj0oahntoOyldJySrkBA4YHQMykZB6HGpRVGzTwMSj6Sg/2c18KuHjN0HnmnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso619260e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166465; x=1790771265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWcv1ApL6q2ZhyUuH+tMQlo7vXHYJanHFmdCnLCsLWk=;
        b=hUXiC+W3dGjJTp+lgp7O7SL946e/P7o+5JBhkzwvCeXlcgmDs3GYTACTsaiDcYjVWo
         CXB960A3fHfcBlaBuYisaF8uU7g2hulFKyl1dBvEIQ3ECnat346RwF7N3wtI3XRAxnqs
         c4BaKd+XRVUFPDjUAxsLtdk2izN2rONHJkC9zfOoHjbN6CwiUAL4lqAq/i8fazdX+bo7
         /zeoaXREl5B/YaEnoXtFe3QsGQR5GPds72zkqO6R7oyOMn+Oqb1PN8hLcCchjE0BMCVh
         5rjtZDPz1+zmcECd9y1BT+mlrM8RPSBWcYWUTCMmjx9MmibOwEM7LqGQUPfj/iaRX6F5
         O4rA==
X-Forwarded-Encrypted: i=1; AKwUvBwB5aIYnXhghHGK3a7ro5GlQVEXZFzTmjPbi5xXQyoNrPL0oOn6TqgRLBYpK1sdbu6KJbxnkrpstLnN4xAs+UEZZQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nMdVuhRN10IknIbD6D68uLGX5CoqMe9HlyaurRm12Rhdq+Aj2S
	rrn7ndWRVgStrvOeqXciahMQsEnJkR5ZgMB3eAoh8FCMxv/07onD3sWwxiUlu4R1lQA=
X-Gm-Gg: AYBFou2NTd5ta88YyKePGMfyl/ckTQAQVnbhiHN4BNVPj730tHX5e6FngEyau0MZSZ5
	tHyIw4zfpv/G0lGGaLKeW+4NnNCp467io/7tbFnm/ldkDn4h60Dswxz1heP6BTv7ce1UnyGlvof
	kNx6e61eU23cmAUtlROUz0+egOdlKHDIYKwHpMqJh9Kocjl1Dn86vSiBA7MIxtpXBhf+/bRXMs9
	F0ArLOXWJHsV9xK2q2+wa+h5Ymc7Q1qRnqbhXt8jM3dz8BpBbW4Z8OW6sinH6epFb8P/QQutWQa
	QmitMAP58oQbL/99G4wMgyCAS34UtRAjds6VIgJa6VYT3Nl6XktPhpDMHzxkOvw0nLeq5Ebo28p
	pPxQ4Dy1ohzpNao/t9VlMmVGWmUrx5TfbCFb6k1Is2Eex3DUkDN0DgDy7a3oAR/md6o6KmD6fQB
	wkrrrSWlPPWZTQy9AYRu7OkxhhmWuBxKqukhuiN0rj7xoYtfyKKdU7MLkXn2CouM5vly/r35yeY
	LNosEHnER+nra/B46OhiRO0SajjZq8mqXJyCQ==
X-Received: by 2002:a05:6122:2907:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9f159bce9mr2917178e0c.5.1790166464684;
        Wed, 23 Sep 2026 05:27:44 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c2a36sm2990553e0c.5.2026.09.23.05.27.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:27:43 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso597324241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAciqYEKXM02MVa1V5OnZMvr4t3ku2HiBS7HZ2wlEa3OV//ErVg4myir59zydtAKViivDIhjlsKcL4zl3KpJSryg==@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:7a1:f7d2:e81e with SMTP id
 ada2fe7eead31-7ac1d2e81fcmr2402107137.23.1790166463439; Wed, 23 Sep 2026
 05:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
 <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com> <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
 <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com> <CAPx+jO99DnXLzarD_rWgr43e6vzWCJjYWaVFh_hhr6rtivXxFg@mail.gmail.com>
In-Reply-To: <CAPx+jO99DnXLzarD_rWgr43e6vzWCJjYWaVFh_hhr6rtivXxFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 14:27:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqNLG15fAUt6EVf2-Ek1T=tR4jykean3c-K98+HP4TMA@mail.gmail.com>
X-Gm-Features: AclHuK_87NLy33tHoFHeNjhVq_Wp4n3b4z8txTDgsw2XX2yqZfJAlI229NijKRs
Message-ID: <CAMuHMdWqNLG15fAUt6EVf2-Ek1T=tR4jykean3c-K98+HP4TMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Wed, 23 Sept 2026 at 14:12, Ulf Hansson <ulf.hansson@oss.qualcomm.com> w=
rote:
> On Wed, Sep 23, 2026 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 23 Sept 2026 at 12:33, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> > > On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
> > > <ayman.chaudhry.kc@renesas.com> wrote:
> > > > Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power are=
as
> > > > to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ=
/G2M
> > > > v1.3 SYSC, however it lacks the A2VC0 power area.
> > > >
> > > > Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v1->v2:
> > > > - Added space before closing brace for `ca57-cpu1` area
> > > > - Updated include path to SYSC dt-bindings
> > > > - Added Reviewed-by tag
> > >
> > > As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
> > > Add r8a774a3 SYSC power domain definitions", I will provide a shared
> > > branch with the dependency to Ulf.
> >
> > Alternatively, I can just collect all pmdomain patches in this series
> > in renesas-pmdomain for v7.4, and send a PR for that, similar to what
> > I do for clk and pinctrl.  Up to you...
>
> Usually I pick the corresponding power domain DT bindings and share
> them via an immutable branch called "dt". I would prefer if we could
> keep doing it like that to avoid confusion and special cases.
>
> Note that I already have a couple of patches queued for the renesas
> power domain driver this cycle and whether this series conflicts, I
> don't know.
>
> That said, I am planning to pick patch1, patch2 (both shared at the dt
> branch) and patch3. Would that be a problem for you this time?

Fine for me, too!

Note that I will have a renesas-r8a774a3-dt-binding-defs branch for
the clock DT binding definitions anyway.

Thanks!

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
