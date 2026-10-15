Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0E4BEE58
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062340; cv=pass; b=tTDIj8P5Gi8R5wdlRzZZyXlFWWVtnbhuMvVHnOk+RVav+eb6DVfK1xzlsiqPyTTv955i6z1llTSrgK1hLBallj0fgN+A7fRT1hmYJ5EHzThMCq0tvtdi5++JWis5vAU2rH6rNt2aHb5FTw2kQ2yM6UWWrG3juY19GHt7VQ4kZXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062340; c=relaxed/simple;
	bh=yPSLsauNWO+8YHpLu3P066P8SvE3P0pPuLQr766NovY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ni649TGMCeF4PitR1WEUgyuXDVc/EMYhHvRFnZwhcXBoOfnRAjPJntSG6D3/zLM6wyocH8+weVoMInEoLXOcYEfukCDDaWwAhOMcAbHw99z1nySC9M3Ipjbed2zZyfPA0TZvX93SO3k0m+Bi7WaVVeSUF8/kj8bmEyD6oZcqLjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xxeg+l4K; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxeg+l4K"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so4866341a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 04:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792062337; cv=none;
        d=google.com; s=arc-20260327;
        b=ogzyIQs+e8KhZdqcEbGeRgJQsviyEO7iVn9uMS0++RTRoCPxLHLsRAfqtAQUvV6mAx
         yU42VBG2hca5vXuUKdAI1A5fBv+b2XtH8KKqfMzGRirUv0iqlCFMyL+fOPAfx9R/hyyr
         H19nUKjjr35XaxlZVKnBXedpn7i1iQND6sN87lx/9uL3cQzn5y44u/4ANBJ+fU8PxZqz
         x9uJhp/66m9ez1AyxficvVo3Z+bcF3EhyT34RWjeDxdwsfmay0RaMx4JtFsdDFaBiHaP
         pQPN8e3KMkTmxI+VkzFA7wps13n+OIgSe1ctAXdu516AXvLbCXN10nqOIG8AALToueoZ
         x62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rt6zLrcxhkT/9F91e1q6oOlpV0iVcuAdHVJ3g/kDDn0=;
        fh=z/CaBeHCUebYHTxlSayFNE1Wtfmh5ec/gjZQ57vhobs=;
        b=Qk0g7muKUzyZVQvVllfkxBmnK2zOjqBUoYBoY+mJaHOiasahWsfGoA6Lro+/+Bvjku
         lEom3sbwqz4nCfr/JBF4Gpmate5fHWuTlm4jBOipMGbo4pbs9gDVm9RZZD0xgWRqk3qQ
         uFsbG0dqHBJzIs4iC0QzkHcYkksvGr0YuIWDVJTrPApU5XYAA24co5SyXxk/rwnvhe6z
         xCpQ04aDcCtFg/gBxbt9kaN9OMQdyf1f24cNMmO3TBuJQWYWn9o7qZsWoVt8rwXWNULf
         bX5ofK0C/u0KoWaxqB3a+Pdh46yMIJKkci+j50FtUmvKMI65fZb+CduoKte0jG2dUH6C
         3e+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062337; x=1792667137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rt6zLrcxhkT/9F91e1q6oOlpV0iVcuAdHVJ3g/kDDn0=;
        b=Xxeg+l4KOR/hsGeSlEtXAcxY2ztBs/3XMF9Zf5ioIf4704ptJCJ9M0CbGOlx+WtEg4
         pjjTBpvuLzPEZ+R3zsErZQqDbyGffSeDsMIO2aNLa7I8i7WGf0EELZibZoIUGPTNz4Uz
         kAo8VazbOQXtmOoXZBr64vKG/t+mc2sgPOTHgeLEbmJhtfwjhU+cROP1zn0PU9xj+UFG
         /AFjLLEvuutKivJMy0178xoMDWnUkMjLPCJCKaQ6E/ZCTp9hkc7crEyha8UHVwlpnNQI
         kw51zaMdvwlYgcblAxEc4+3oZx52SyrTWG1H3tDDu198O6pbsRQggTJhoMI1ji0QdPGK
         qz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062337; x=1792667137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rt6zLrcxhkT/9F91e1q6oOlpV0iVcuAdHVJ3g/kDDn0=;
        b=ibGtokJnL/I6sa5hCN7m2BUdzacJQQ+kVMpsv7dEh0uprXueeUNGd61kc+EM9PLPPF
         QpGV/RvcEgN/AA3Nuxlto52v/6/HYdXsAsUS43SQALebims0JbLPXbwMF77kN0iMcdCQ
         xLNMRNeAU7jvjX25aUwAGolpCnzqEIYCrFRZ0eqeFGmROxFErSVDOS+oiga2eDJekf0r
         0380DJaN9FA8mY4KLnJP2da+Sl6bmYVLRmeOKumm+wFceov3myV24w6IQ4tJBqNE/a2v
         eDALC3BOcoyExSC0hgXVZ6m1wYwwYXUMGUcmFJN/0IqjX7wfIJ8x0i8GGPSW/P72echE
         0bIg==
X-Forwarded-Encrypted: i=1; AKwUvByVAL+BXGwcKL2NaJc0vMRCLETFR8u6LA5ouf0FbF2HuYhQ1i3plycWnvsnusVrCRj6MJGemyfkgxNRJVImMmtH7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVvS/FRMLftnzv87gaIAqpsyqx9KSdLhmYiDvVcnTwL80tiuse
	YMm6xX74aiO+RAjfsqF9Y8ItWnlQMw+g2EzWjlFj6/rxRTmy5Kfr5Ycu4dnpdnmmZrakMPxnjjh
	VMOTJRdR9zh9ZQXqu4YPUEfzqLJcMz+w=
X-Gm-Gg: AYBFou1xh86S7me1Hrp0CmUuG3a56WYDWMb6Q9SMEc6QZZU5ywDlxzmoAQ24YvSXFrW
	ZyN/Oc6w7TTbdggOrE04sQtxl30QONjJjp3l+mw5VuUL1/fqykPiDMDsVicEBBrCGH1QQ/ftAic
	dQc54eOXxxGNolCaqlcn4hExnqfxjBK8xkTJrnkdNWHOR5ooUJot2X01jM5dqQzPGKRjj18VytJ
	dxtvdUagFQcNjXO1hpcsc1LIdcSw7sj7u6blyxP6vUa2hTKfkjajDFXKFbfoeug/tF8wlsvzF1b
	CFVPBI0LqmIw6OfSrZAHlCVn8Iq5culYae9KQlK13Ly16bHC4iSB+mHkHnI4fLRHY5AHfFD63rk
	LVBiEOryHoOtKdTUElF5MHtXXos7w/yAMH5YQO51GydCHe6H0nzLE39ipEYjZavOnVFSp+Z5QjX
	o=
X-Received: by 2002:a05:6402:52d8:b0:6a7:ea54:38f with SMTP id
 4fb4d7f45d1cf-6b17c272132mr13118289a12.32.1792062337050; Thu, 15 Oct 2026
 04:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMRc=MdcWS0c9E0V3cJj9B9WMAe0vSs9e2s2EauRH5zFkOng+w@mail.gmail.com>
In-Reply-To: <CAMRc=MdcWS0c9E0V3cJj9B9WMAe0vSs9e2s2EauRH5zFkOng+w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Oct 2026 12:05:10 +0100
X-Gm-Features: AclHuK9XNtyctc4-zz7ILqGJPTJfzfoX5rtUFZXlnBV5qOrrlt95vuLzAJaAEjs
Message-ID: <CA+V-a8uVxwP+AFbRYb-weN+EHQ5rFxo7gXPus4muSrMri1QAAA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and
 RZ/V2N SoCs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Oct 15, 2026 at 10:43=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, 9 Oct 2026 18:57:05 +0200, Prabhakar <prabhakar.csengg@gmail.com>=
 said:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > This patch series adds support for ADC power sequencing on the RZ/V2H(P=
)
> > and RZ/V2N SoCs. It introduces per-SoC probe functions for the
> > renesas-pwrrdy power sequencer driver and ensures that the necessary
> > Kconfig options are selected for these SoCs.
> >
> > Note, the ADC driver and binding patches have been posted separately.
> >
> > Merge strategy:
> > option #1:
> >  - Once the pwrseq-renesas-pwrrdy driver is merged in only then
> >    the sysc driver can be merged via renesas tree.
> > option #2:
> >  - Merge all the patches via renesas tree.
> >
>
> IIUC there are no build-time dependencies, so the pwrseq and soc parts ca=
n be
> queued separately?
>
Yes there are no build-time dependencies, and since renesas-soc is
closed for v7.4, the pwrseq patches can go via your tree.

Cheers,
Prabhakar
