Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957FF3F9A1B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547805; cv=pass; b=XaS6C39r6BbDnP2XabB93JM04u7UUSTdf3hJ6LhdsZtT6uFGUBa+maXgumhk7+ag0k1OuyhUjrp2JhG/8aQD+5hxtOo4bHv3ikTWAOjNNc09z9pbDZGhf9HtPAt8GhKNLlaS2rNkmU1xwoMdzStYTutK4ymYm+9u9Xu884USHDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547805; c=relaxed/simple;
	bh=fdtWv+prESztRJE+/K3wcrpe+upv+fIpI0YZYMbpZeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQH9gEk+fTmpCprBGx7CGds0rfrFPlShJNqIrIhZyy4iquPsV7y7MYuAPZlmXBQ5C7nVH4P9kT27zvdYvlVwk3ChnfPFsAS5XxjEnRx8yV2AAZ/f9V223h605vRHPu0YbWH5Ms4pRdnOLxH0LPHEZt5hcBGgRj9mWtf4edvtvQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipvHfziF; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipvHfziF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so13572895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2026 04:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784547800; cv=none;
        d=google.com; s=arc-20260327;
        b=Rr7qT09IBqPFI5ne3HiNF9YFIBf+Wd67IN5lQvxW77OeqF1i7Fqju4EKbaMqYaLrVv
         NPoRGXMpvsnd0SMYXtVfI5+URFpMlhCf6Xi79zl+tEC9WoJckhZBDiG8kfPPk21EqVdu
         ya1g37IGsX+7GBy9yh7QBZKB7ohSb0S/Nqy1PfpqWOrG3V13MWxNSXQrGzRnky7hiNpn
         MbbxzJn1D9z0hpnHLdvEYHsfExcBF5GdY6CUxeLpK8pkl5rTrCIXd5Kaz4tnOT9VfJqV
         uaOMTCMVFz/GjtXe08lLwTeTaF+ogXhWvdtjBhmAOhIeBrOW6LXull+D5oTPHI05R187
         rd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fdtWv+prESztRJE+/K3wcrpe+upv+fIpI0YZYMbpZeg=;
        fh=K0w2zw732XyFbcSd8lgIjK8ionHUMXDUkbe21y9BiWM=;
        b=kv63yGqzuTb4k8N8onPmy3KlaSVYdkfisrblLMKKyizkxdpok+q2Hqd/2fr+iArMLT
         2krSUFBsVMoEm6NLDGCWKLjsSdczbCYci14UEwrFsEhYAqFd7pUt6RT9Lh0gfeMa6fSp
         6GNHYrHS57HMMJsgoFGr+XQSZqlSdim7+Wxpj71KDloAoE8bG/76VzZMT6B158vBPaKo
         fSUr8a2EZl2HvRWT4rDZx/y2726bxQfGdyiQnYqPD4NxUhNmTttQ1fX//3/3zzmq62A0
         VcpjtUXxNSAtsxawP8/NezdpKdLd20VKRi0d9pEFH1D+QLPTSM4Gwt1Aj2ODYX5eiFtv
         81hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784547800; x=1785152600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdtWv+prESztRJE+/K3wcrpe+upv+fIpI0YZYMbpZeg=;
        b=ipvHfziFb88BeNwLCAorVsFn0dU/ZRgXpR9MPnpyblN5Tl4iu1SMIXoAw7/qDQy4Pv
         ZmB2nLONVeAr/OPMJHLw7tBbK+THtvzfN8y79OHvtRWCLi4uyH4wNk40ePx6qw8ZyMfw
         60tX7+OIKd6XbS4yQO+ElGERRqdjX5IAbyuNQLpOSm9BJTMbAQ2GoSAnlY1FuMkLBQXI
         6jIBuKfHXlRh+p7FX8niwZ/kZHE84yKTfx+vWmVIVJSqTzxrjdRpOx/96ihUFG1xaZpL
         0PFF7B7NvhoRpE1OuZu4vuwQk4UzQ2dWx23QeTf4rInyoqBfKqKCuodJFRzKG6VEclPb
         /4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547800; x=1785152600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdtWv+prESztRJE+/K3wcrpe+upv+fIpI0YZYMbpZeg=;
        b=GdyIcZS2VSqM2yBz2rhveXj8DrwjTwzv/gv95fHclCWP1PUwgEBGkLSbJLXKL3namB
         Lc6QtEbkNqS0lJEUC0UgR9JzU+GnEwg9tEyLwkCa0FtcHWqI8qVg00cvyGDaUklVnurX
         aRO0wms6NdFfqAS58Yad1o4yqaU0Y0hIuHrPSchFnqaw9eCMZhZoj1dNx9o4d5AXk+LV
         raDMAmBSDrQOiBb9j8fL6Po083lnMMHExWiV1TzjLjU224vuG/2olJyb9zoygMri9GGp
         HOtWclSXnNc80EFWYxqgOR0Fn8HzHAMx/l2L8ktnivDPrrwW8zPAwlNV8gUfCQjic/EN
         k/dw==
X-Forwarded-Encrypted: i=1; AHgh+RrwzZiDwdj2LKSQ3anwR3pNVr/c6LU4Q4yqPoAl/yAIFZsYZObp9JrrJg60IRY3rClU/owEOFMcZDeC2pXChFd9BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywch54kluuwPR1ao03+Udwp47eQRPPMfVcLa0iCPyi3xKQyj6jW
	gNG+ZTHF1VSwiGD1JREri0VVr2XUpU1qma+LUPK5LANTqTV/EbQepLFjFWM/gMQm11HIUoQ6Csz
	TMrMMdLisftuELHp/hpovzPyfbsnr1XE=
X-Gm-Gg: AfdE7ckiUCeW/nvoUFZ+03Az0uvTlMk1BWwwQ12xcs7GC68K5b5ak7R+vUaqH5octDy
	YcprgcmBoMDcWL5qdwgKfW7yl+S1R0vlamNaP6I1wYHzWH5mFdZLgz6AgfUOrcTQ4QXl3Y09M2g
	Kapddp16RpxNyaNxJMFSeyqM/LSatpS4CEteY8xeRHCj4kaBZ3HMjc6hyX7oUOZSdYly1/coXiI
	nboK38HwqAJG8CIjdehmg5krpu6kuzK3emKYU1+TMS7uqEnPpYkkxhkmZdJayttm8DucPrfJ62X
	NaTXQlrBBkUm8wpykupTmXpdSE8m1JgAki5y/Zqt8Z4tnPXY/dLDS8C4sg==
X-Received: by 2002:a05:600c:3485:b0:495:6193:c6c0 with SMTP id
 5b1f17b1804b1-49561a30bb3mr23882765e9.18.1784547800422; Mon, 20 Jul 2026
 04:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715222417.2997712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <d2213a9b-9a12-4ebd-beee-9385ee4e77e7@kernel.org>
In-Reply-To: <d2213a9b-9a12-4ebd-beee-9385ee4e77e7@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 12:42:54 +0100
X-Gm-Features: AUfX_mzY7bY49TGWSRlukzBkDBBtD47hjKyYIuJbD-DXbsbN1rg6kSUis-qm_Hk
Message-ID: <CA+V-a8taF4U7QD7N4gQZWAOC+vSuTpxgk9OJhqd28NtN9SmDLQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] memory: renesas-rpc-if: Optimize transfer overhead
 and implement runtime PM autosuspend
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, Jul 19, 2026 at 3:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/07/2026 00:24, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > This patch series optimizes the Renesas RPC-IF driver by significantly
> > reducing software overhead in both the direct memory-mapped (dirmap) an=
d
> > manual transfer paths, maximizing transaction throughput, and introduci=
ng
> > runtime PM autosuspend to prevent aggressive power gating during
> > consecutive flash operations.
>
> Why is spi patch in the middle of the set without any explanation of
> merging dependencies/order?
>
The rpc-if core driver acts as the low-level controller wrapper used
by spi-rpc-if. In this series, autosuspend is enabled in the SPI
driver, while the corresponding pm_runtime_put_autosuspend() calls are
added in the core wrapper driver.

Apologies for missing this explanation in the cover letter. Since
these changes do not break build or runtime bisectability if applied
independently, the rpc-if and spi-rpc-if patches can safely go through
separate maintainer trees.

Mark has already Acked the SPI patch. I will check if he is OK with
the SPI driver changes going via the memory tree. If not, I will
update the cover letter and split the patches up to send them
separately in v2.

Cheers,
Prabhakar
