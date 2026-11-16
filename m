Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794832383;
	b=WjGkV72F0FyOiOWMzexkp8/TJweBAYSJ6PRkafmKGTvLp3Cmr05XZqe67i3H+1MCHsTc
	 X5gnym9jAQxWSP57R0mpS8sdyl8V45r9mGBrsdqnaiUkwGW/t8KZC3m9Ras0KjiUJ0l2J
	 2IKI58ur0ob78dHwNuHphX3weXI4LkqwAgZ3hl+FmY0D3jt4gISknmjtAAKjCx5tTZYDa
	 EOtif08bqn3wDkw7xEPFEfqBpdcSxl4VdQB9PxMkOS0H9nlSwDaHCRuTEqiPaNWFucZ4O
	 Sw+HEMadm1HPN58tVTKq1gzJR39U6m4loz6wKX83BKemFpmZ1IMWFaxX0Ko9aWGJzzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
	b=xohHsR+9ANvhNoOOZqSMsirV3qNb+a+hgDk+w9uLULjoJJQmMFNea7w24i1LzC5H8OOG
	 CUaYv6gI2G2CvgXvT3iUR0PMcJqQRLCFmVutOtuc31x9NYBw3RIq62SeElsrobdlYpnu/
	 Lt+24bryvAeMsccDVEoYBFNm9VNnrT1MNy6ibH5y9tmULrhekBU52CJzJqOhYd1Ms6AF3
	 7Xhm6kTdDMpaZHH4PFGApZ9LKBDhtZH1BcVRbOZxxDSjOugw10ZiQ/SSYxCu9bbhuseOz
	 96+rlVJVRc0kdHGYGyLyJbRkiZ2Xe5iIgVQFqM/pJE/qX14SQUJh95pqH9A83yyf0EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IcOk15Cu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19016606A332
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 12:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19016606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IcOk15Cu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365d26ccbdso17760831cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 04:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794832382; cv=none;
        d=google.com; s=arc-20260327;
        b=PBWFO63Du8SlFBUw/rfdruk2cN50qttsr11Kcgp4UMJtqF7ZeP+QWRECEKLQxs2vBi
         pAGfaeQ06oxxi5WE3Im9lhCfDp3N+0u0tz68tSit95Sueafd9YLWOY8RZYzS9Vsfg+67
         HJo9DN54819DPhauKQJShg8USRYln6TWPZNosZnDay/b+JO0wj6ZfS+nIcc8opqALbcm
         7VPXqdb3Me9OkZ/uXMINOt5refhy33+Xq7Zbrv7wMAqivC1Zx4km5f7z3GKOz3iOYvHm
         wRYut+AM42vs7TUJO1mNjbTlRW0OZL7tLz8XRA5v87ajtiZ+D4T9cpum7suS1gOgBtAT
         qbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
        fh=rbYh+ri+Trbj1QgSvlkFDRbAb+sl4ELrmIXHD809TKQ=;
        b=Ru8F0abELm4C0uLZprvHblOE18Fx5Hl+lURzxcstBeXhPfk9a2vRARWSCVoAxxJw54
         hUp2nJ05DXjqF44lNoH0z6zj/oISxfJi9v6dIl3ku32sHB5DRnFW+qb4Fz8FDcg0p62v
         zaSxDD02fPuDJtKZ/IetIfe/pqQlD36A8qpEFjdv+YUyGmS0NmmkfyzIMtopjVqSrf4n
         HenHrYma0ivLHUr/1rqdQAIoYF0iG4RLe7MH7lvjvkKRkJDe27YcX6ElE9MKxsh4sHea
         cvpBW/cwUAkcyMIHIA6HdHBSHl8CqDDFnEE+XSBAFILAxIrVM9kqi6oIwyX4BBr5p81D
         IytA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832382; x=1795437182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
        b=IcOk15CuKATcVulxoHCp14kUuevTmYgHZKB7n60bcx5rkNy964Gyxc3ag1bxUQeRFs
         VLtgFbhYRHmF96ImNpOvCZp4gKFHDXqiCoyiCOTOrMA5WEnlzS/ts9d0wOmN6hK34Jl2
         sYWjkzvDBYN4qkKHdQrqY0VmcqBNRVwH31Te466BVkQRV6Jnd1Zk1443AkIonYPDjk0D
         XYiNbnxfunyelBoUKSPKQa51IphLnYjRi+17NVscWOpEjxltSMGLtHb3IbXsSEwh3WjR
         VKUYX3Y3i3HA7hqXJdNzWzaCNYhY7Y9mXi/QSgUBxny3RTG7RAUI6+WObJjy5A9PeHmm
         ci1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832382; x=1795437182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WM4OfNSQop42FqaSuvQj4VY5i6qnj1lHHTtJWd2n1+8=;
        b=CBIrfGrbjOCSnXrP0D1Tu9aLczL957T9X/4Wc18GMEDbN5B7gH2feF+q3gPwTOdP0I
         +6xC0HN57Opf8kOsvA4nEIxhvbp8b6x0BsrUafPBjAtc+0nNvWBccWPn7/nnvH/onRZi
         mIL2Cerys3gIc8tW0UBtnKoudQgXNwu+kd4JHp63OS6+OA0ShQvZA5Uhfn9qJJXfr1nr
         HxIIm2lvrzsOFOo+FaYi8k4G2VPHqnJ2803MHrtVnaj29Bh2ivP4zonjzAUcfk3ZikpI
         1N2iH/F8HYrYXGub4qktSZ9jznZJa9MSlg5HJrKxUryybq9gAQDAZpSrfopvlOvTxeUe
         po1g==
X-Forwarded-Encrypted: i=1; AL+hErF9RC1rMX7CGfuIN0Mq8fKhP9H+MuLkiRUTIXpPjxCZodVyPZ5ySl0c8q1vmObGowtflDHxs2CDGSl+upKiZYdoKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JpaZ6UmuPWjwuiJkzWOgQks0uPAZ8KKh7xo2Tqq+gy697yqil
	TU3GXdQ3URj2z03Bn36tBT4BOje1xYkyOG5z+AmrPP0keEx+E22NeaXzQDkNxG+6zyDo02FNgk1
	FV+pkW5xEp+RiZPy4vLgfd1SSmBtr6tHrUQ==
X-Gm-Gg: AYBFou3mLx/EXEdBhXAAn7190oIb86fjyC8LT5qLLPLXItSVB1SRKfzfHxzZUyijwXw
	CWOMaK2YhWmIF0kh0oUlBWnqKNJF9LNBxpF/M4387tMyRBj8wTrG12TV/oiHRancUHyP9Ktmdj0
	za7QGlOPAolKOWBt7urf0NIX665IiqKh6v6tfFdSyoTS3Ue6Qp692OlL0x+pYQIslFTa/mEhBhv
	yh00sJYe2WjD1Y3oTGSUPGvlXqml8iSTZk5fiILr0ntta3vMsCgMmZTAnlfsbWrtvrf6z0ppfRw
	g1mbUpiTU/YCCXHqUFlj3CCPFy/HzOHdQnIJpfRtlsMKuySPoUxKXxPTSGIrKDoYmkWGa9JgcuP
	J88xPUc4WQWl3+nYXmcT2WJx2Xrms8rcn7xOxpJJdmahu93JryUxkzlXRH8FTvIjooYSW5a4=
X-Received: by 2002:ac8:5d08:0:b0:535:bb7a:884a with SMTP id
 d75a77b69052e-55ac706b54cmr161105011cf.19.1794832382051; Mon, 16 Nov 2026
 04:33:02 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
 <20261116-sdhi_hs400-v1-1-c5bedd312408@bp.renesas.com> <sashiko-outbox-217001@kernel.org>
In-Reply-To: <sashiko-outbox-217001@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 12:32:49 +0000
X-Gm-Features: AclHuK9oq5_INK73sxz0yKmI8hWmO1dhokNEi0IIopn97AvOdbkyI5N8-h0lU5A
Message-ID: <CADT+UeCde9kNvK5Qroh-iLp9VHq+E5rvOOFKcc+PnY4uMBo3sA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mmc: renesas_sdhi: missing Fixes trailer for suspend/resume IOVS
>   fix
> --
>
> commit 2573360487a180f719dfea67f2b66adb00db6390
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> > mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
> >
> > The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit,=
 is
> > not automatically restored after a suspend/resume cycle, causing the
> > regulator to report an incorrect voltage on resume.
> >
> > Fix this by caching the CTL_SD_STATUS register value in the renesas_sdh=
i
> > private struct at suspend time and writing it back during resume. The
> > whole register is saved and restored, as IOVS shares it with other bits=
.
> > The save/restore is only performed when a regulator device (rdev) is
> > present, as the IOVS bit is only relevant in that context.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> [Severity: Low]
> renesas_sdhi_suspend() and renesas_sdhi_resume() were added without
> preserving CTL_SD_STATUS across hardware reset when priv->rdev is present=
.
> Should this commit include a Fixes tag?
>
>   Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")

Will add fixes tag

Cheers,
Biju
