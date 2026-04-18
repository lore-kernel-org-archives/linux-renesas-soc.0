Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D230E0ED
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776541503; cv=pass; b=Pxm/k7UtljIyEVnV7vS50eChzOvnTPJw56AOchNP0x6ScVnSA66v/Mq63tFwWQrFWtSbiryr/r0xOPYNDJF1PEs1F0wHLbAmVNz8qySCaI0tyQPOOHFTbj8Vqd7klJaKTFhLg6E+deojq+fHEZ4denizKNJywczdosi3VW9iMEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776541503; c=relaxed/simple;
	bh=YBqeVjINNEmjcxJSPn7QOPfeQ6x3p+JPubfHfsRJjOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YB/bC45QWRmFGQvh5mKhDn2PBlSvPE0i2ODQv+pvTbfcW8W1uYki7rAsAtJgbP3K1QSHKlzI6cmTPKiJJ9b4NXcQeGf0kmlA44oVal4zESlDams3Vl3uuvyQdOxeYUKuTojY+k48/XQRJDKusKxyfFYyrj8mAkmJ5lPwgKF4w60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpgkOdKd; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpgkOdKd"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4232323a7daso821914fac.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 12:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776541501; cv=none;
        d=google.com; s=arc-20240605;
        b=O/UnoOGF7J8F8e87CiQSQsl7kVu/lXg6K2zviOx6Sh2K8Q4TK8Ui/MQXV0bkqTZi8O
         i7jtw0GNAeRFMkxXSIoOTs5fSudhQdSziYKIxqrjkwRJUp/23DEfofv4tOXiNra/mIt1
         H9q2iGojRN9cHgdHjH8iK+1ZTFuPfLeE1mR1fAQHSdnLhYiYnSWmtbTMsQhZqXuwuQzL
         QN4+7hhStxBZu+8HQiKVFw2VgwdXKKdWxVxfqFzis8qVsDBzpuSl6DG6wq3Hc7voy6MY
         Db/gDLNMoEcy//cS/1ahmzeLkLUCj73DA6xjf2+nKLa0tOZ7LOG+Uc+cE0S4xgYAeSWP
         o/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YBqeVjINNEmjcxJSPn7QOPfeQ6x3p+JPubfHfsRJjOg=;
        fh=/Ln5kOtMcW7lceS8Wn5HQV4bT5EUA9ycxWqeRO4kr60=;
        b=MIWUE4DcHQDRYRJbbSol8lKbJL4UKqL83QI0ymj0rzE/vKb1todlKDLTvsDuHe0CO1
         M1IIBTgDVSGFNwhR8p7XYP4cCbbAYEVjrpC69PzrzxFwLcM916ChWZUTGqPUvQc/iR5f
         LciUcB62Dj6PYDqq91O5MeAz/Xl+dex+ME3Y5RPLiyAyhOrExiYmdeNJ+o4rwrtQnAkD
         lb8Tji5FsmAvOG5llB9JW1OzriRbdola+4g66qmtzQkAlAnyhjuocDi+NFGOO/8pnWLA
         T8wQaaD7DduqXxp6gDASnFdoUSCJrpJzCxeh9FZCDqL6GcsCKVplg6PVY3JpfJVRA++Q
         sQfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776541501; x=1777146301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBqeVjINNEmjcxJSPn7QOPfeQ6x3p+JPubfHfsRJjOg=;
        b=CpgkOdKdcsdtcqbFWyzip2VxmMPTMRceYx3G1as62tAKkn2n6566cwfQGL1XnSgb2n
         edQ2gxubeAH83k6XsWt8zvE2LSghXmDrgoG5cswFSl9Q100/N5OIUSEg9y7Q4JSuI2ZS
         vm4/qLnjavF82+0iU/FgT6U3qfHQCWIYJZfI5pF7fMrw6gDwbhiqMI90Z894EjcOCSFT
         7hjT06Gd9llqtbHnprSgOW4hbsaJbZirBkWX/fCDrR8qKi3EFo5tG9xNHJpAPBzpFsBV
         k0Dj/CXvhdZgTLpV166IxNiOao65W/WIMdjl/I55E6P47EhL4oU9QO7UXhBRM21ZP4ox
         u67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541501; x=1777146301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YBqeVjINNEmjcxJSPn7QOPfeQ6x3p+JPubfHfsRJjOg=;
        b=HHh4ohevBIVg6tUvm3PAL2aN7IcZfd//GkQSOllGBWBEEUJ3BNggGMGRB4tejlbGNQ
         PKq29p0cQvIFw2SSavfXI5DSi7KIlDpJ7zRxZDuUS5K5dPlRITZfMat5H/VrqA6Y6ddN
         4QC0TpxdFsusZc6VHHvPIgLJB5WYDjujvAgH3PSAoQXCgvVpVC9s5X3x5vX7qJU5VUtQ
         I7dJ/SYOHe4P/s6S+vEcsNpjQ08gV7mYlDRqT2zJHGlbJCg8Ju/UuI7AJdZ4RbgZUgZh
         39oDd9jym2POt9v8FbmRhYF2SidK05Mo7Jkh/mUr3neFz2CwdUJI7jdTGqRuesBtQ1Np
         CFNA==
X-Forwarded-Encrypted: i=1; AFNElJ/uOouzbaQolL90k/al4NW31azC9btqz+NOYplf1IQeQ858Q8MF8lVvWiS6jHW2K9EasyzqLh/fLkt7g7U41amYfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Lw72WJhvzbHj0rfypB1gF2sIVq84OdP2pl5mhXt163VdvlRb
	ZBCCNl8cWajKZFll3CtZ/GXurIvwSfeWC5rQSqjTgHYDtkT6Nsd7o7DnNG0I/4EpvUUH4dpzuBk
	0WyhOc8W9ThyzqlrEEWlo4eabIFulT9M=
X-Gm-Gg: AeBDieuO0v4sGT+JpIRX/GArY+o2A+VfwnLBSvi9lzhiGtjWXB0Kuaa2wpA/GEm69oq
	DvoRzMA4SD4P8LRQ+6H1Lrdk/d7Cj0qr5e6WfZGJ1E40z4Y/K0e/98Z7pzAPlEJZMbyTYEgxUr/
	RW6yhXwvjRlpIFyS5fQTLhfhe+/aJK3UtavwMql29bZEmt4Y7/I3zvADBT+6mDMI/Qa4n5oNTPg
	UJMulMcHUXsfILP7L74FP7BLGxsaODuppq6c+YyYnDdBlNhjrkIolQB1bLGzx1ZzQsxgpfQPWwN
	jZ05OuG0BXP9Vo+mZ19ztrkJKJ8feA==
X-Received: by 2002:a05:6870:1612:b0:41b:e56c:cac1 with SMTP id
 586e51a60fabf-42adee29dd1mr4715555fac.39.1776541501023; Sat, 18 Apr 2026
 12:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
 <20260413104240.30493-3-wsa+renesas@sang-engineering.com> <CAMuHMdXaAu82OQXdHEcDqx-0vEYhFGSbxmdHpE37ZP31FzwEsw@mail.gmail.com>
In-Reply-To: <CAMuHMdXaAu82OQXdHEcDqx-0vEYhFGSbxmdHpE37ZP31FzwEsw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Apr 2026 14:44:49 -0500
X-Gm-Features: AQROBzDKIrlSrGY4T83xoCMYimd4Gm6P8u1KpQ3F3OQz_RgA4JGyj9PuRJktr7A
Message-ID: <CABb+yY0CjGfdEp2Ot64GMnbWvhu_DqVsMkZVs6xaKANpXeBjqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: update kdoc for struct mbox_controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 8:29=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Mon, 13 Apr 2026 at 12:42, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Add field for missing lock around the hrtimer. Add 'Required' where
> > the core checks for valid entries.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Applied to mailbox/for-next , this and the 1/2 patch
Thanks
Jassi
