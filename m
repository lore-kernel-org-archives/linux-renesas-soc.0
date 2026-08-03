Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED53B9920
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748081; cv=pass; b=MPYT9DT+nPDvcx4Fi1j4c3tG+vK6uU6adt8lgyKP+mMwBYJYKp3Z5Wi7jzcbH+JXnS9NC4vDknBH6Or4PtHDcUR345Z3V42lbKjLtwu+IFuTBIOwHJhE00hw9VnPtrI8N2Hw28y5Nal2I1SEuh/FyTH10YZXLTjw6duSJ/oV0Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748081; c=relaxed/simple;
	bh=LkdOobaJ9tETMU1B/WXnaAbnzXvWdUnW84rB3ia4EzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rR8QDcAtSpLwNiSmIxeCleWwrzqKVeHDiBtMMhOsb99JyZscQk7xVfLGrsYVjHyKCd7hiKBt/13uVlf7Lmh76hzohgBUz+6g/lcMIhcHRTsWMenv0GQS75N+BO+5Ah41FtzMbxQGaSNUjrxfTM4S0UxiXnflu87/RYtThbGkJTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfmL/lHg; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfmL/lHg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso8463605e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 02:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785748078; cv=none;
        d=google.com; s=arc-20260327;
        b=QLXIOuCr9nv7Kop2e52h9I+N5qMocsstl5Qwtg92nrmzPCT8y6JK8cYLW1kaTV0leQ
         TxwiBhlohDGwou9x/In8XMA8CI6xeIV000nujhhfeoGaczYIAMEa4oEWqzhmGyHyGN80
         /V9EWrsw7F8aX7SceLic2Tb325vYaCbbFb//E87DIZY2ChXP4a+3CflgcLDq3E8Sd8kt
         F1yj5eG4bx453Zz8VPbZhUhOCzO0Z29a5yJ1ySm+gi7WPmv8J/iZ+7TjysrRa4pSTWhv
         Eve1nxYTuqGY98s27nHHc6dV5VSHZgEs9W92To2zpHNmk8pLKLKNy9GalKK8aOFp6AbN
         gF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LkdOobaJ9tETMU1B/WXnaAbnzXvWdUnW84rB3ia4EzQ=;
        fh=x1BvcxtF3YZsTazE8Rgn1BkTSVLfgxY82Iul5qtBNn8=;
        b=Wanlfg84KFEJNbRiKfOoSa7vG9XekKPyKi/MUjdFwcAV/NBUnZGiHKU0jJt8guS93A
         u7hwtMKVQ8MacTNai68aPvtGqscx0AvUJb4Ih5GTVnwhxJd4O/Fv+rcqJ31QFzNE1z6Y
         UXODyaDgU9Qty3MZj8ueK7Rw9hlwMZb+EdWyu8KXvyiZA711Fy2vP4ZPuc6pXpxpELUR
         SmGZxcILTR6VVjWQCsDTItaAI30zkJXRE45JsgJS1UPyA3J89X+PCxIn0cjVDBT+lh4J
         Zq5Yg/mb6ZqOfl4eqHTKWi3iVomQwiJe2GUiKZak91wJdq5lgCf3iWeMreoLOx7blsRe
         zDcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785748078; x=1786352878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkdOobaJ9tETMU1B/WXnaAbnzXvWdUnW84rB3ia4EzQ=;
        b=PfmL/lHgx9N/hHg2BajV0jbkqyIin/1srYVSuxXhh18UbICVVBDDkWuynrm1RclG3G
         b6EyLcLjpQz+Ib9v1uhv/dPymPBhZxNvaCwrS57zI77nreXUgSa7DXreE5WxzOZU5X7I
         QorNLXUjfZR42dV9Q4Am7WkzFIECzAYu1TiAyRBFj8BDBRjJgECq+crr4vyhYuRI2O/X
         U8vr00T46gULvOsO45mBWCmEnfg4d7b+9vx+CFTFeBqRAqTb0jzX4w2rEdRMx09qMZxS
         0cnO1+Y2SM8IA20Fav6gpWYH+Vd4Dxu39tGGjQpMkkPRIi4jcy5XCErN2MBuGtMd0CbR
         nsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748078; x=1786352878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkdOobaJ9tETMU1B/WXnaAbnzXvWdUnW84rB3ia4EzQ=;
        b=I3JRMep6nhwQ74Kl/Wo3225YF2Yz5BaBGx5OunZguNSx3odhZqqdvnvYxAKhBEF0bB
         330m0hONLB/HSEgEqUwyGb3wdNajkC0qw4dUYG7KKh8MkPE73GXniS/zkwMJOoOdZluP
         Dpad/6O5y9bVO7n4Vw8H1+W1OLg3GHMhSxTZ3v4M+S1i2keU0WsOtkD9TmQyUTjeKmAl
         Gzh9zllNCQYD3Nlr2brk84Nxhh/0gobr4N/VZcxg6H2bgNUu54HULmNNR7byDebORe4F
         bTXAj4Y0srt2rZxRWniPQ6q2p4nX+eOPSQiuT6IqnR7H6yJrW9lKKLinhIbp0KOpJaDy
         wplg==
X-Forwarded-Encrypted: i=1; AHgh+RqN9hG8IWnnfK4PJR6Hvx54g4ZanXQYsRlgpy2+mSme9Z2XeTdPxRhTgPjrHYggGDTZem9+MPVQ6NF4yACcpjxIEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu4RRtiaw0BBm7/oVjTRhIDc9kIlfej0/UBQDEDbRwOxr9iM4k
	kkJvvNtrW7XPk1/pzc6xitT1iiDn8pxIv7doyByHCeYPeAldz9+/P1uj6R7RJLiqhPpgw5H1EYS
	3XpQYn24JHkfnJJGyencmjswYCM702RE=
X-Gm-Gg: AR+sD12FyDKF8qmhULsIjbMF9M+mEUfILIyKr69KS6T/2Xik0kD3hMIblLbRsZfPZU8
	LrNx4V6qjdsi33xcTgAJxKT9UsgLI2fr9K9skU2o/UdYf3qv6Z7Z3/PTMM+Ju5QIJBSG2Gjl0eG
	buuQ1pP9GCTVa3u4Y0QLs3AWRrVt7CT04fSgJy5YrnX6onxWBzCOvj7uWjsLJjn62FXWjF3L00n
	XBOMyw6PE/dIBPXhgMTOzfpBN4/TSIjwb0d9TZLRo1L8jFQomuzgdSxQui5RkjraWWsCBq36Sj/
	NUYv8gulqzeghTf4Cr42yjFqz2CmO8y36o3KjNhw2Qpz+K3AD7PvdJyyiVUwVSRxoI05vErzGUW
	mJeNa3APzBJcyjB+xjiqAut+hZr6C3LqpoVQqd6pw6y/E/UbOkRo6IKuK8Yo=
X-Received: by 2002:a05:600c:6989:b0:495:6338:1453 with SMTP id
 5b1f17b1804b1-4980c680bd5mr228792255e9.16.1785748077534; Mon, 03 Aug 2026
 02:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260727103449.3188105-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <anBEQJ4VAaZfsUTw@ninjato>
In-Reply-To: <anBEQJ4VAaZfsUTw@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Aug 2026 10:07:30 +0100
X-Gm-Features: AUfX_mwDt7y43_GZZo3xMYD-7jJAVgHnrw7hIf8_OQJsESvTSsg7fbCLMH6ct0g
Message-ID: <CA+V-a8uurMAN5nv50GBN6O5jxLzA27c0vo6Af0EP45AqSWph7w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] memory: renesas-rpc-if: Use runtime PM autosuspend
 after transfers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Aug 3, 2026 at 8:33=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Jul 27, 2026 at 11:34:49AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace pm_runtime_put() with pm_runtime_put_autosuspend() after manual
> > transfers and direct memory-mapped read/write operations.
> >
> > Flash page programming may be performed as a sequence of closely spaced
> > transfer operations. Calling pm_runtime_put() after each operation allo=
ws
> > the runtime PM core to suspend the controller between successive
> > transfers, introducing unnecessary suspend/resume cycles and potentiall=
y
> > interrupting multi-step transfer sequences.
> >
> > Use pm_runtime_put_autosuspend() instead so the controller remains
> > active while transfers continue, allowing it to suspend only after an
> > idle period.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I tested this series with my SparrowHawk but it doesn't use the xSPI
> code paths, so only this patch is only affected. No improvements, but
> neither regressions.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
Thank you for testing this.

> > Note corresponding pm_runtime_set_autosuspend_delay()/pm_runtime_use_au=
tosuspend()
> > calls are already present in SPI driver.
>
> Unless I am missing it, there is no pm_runtime_set_autosuspend_delay()
> in the driver nor in this patchset?
>
Its been added as part of the SPI driver which is in -next [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20260731&id=3Daf4b98e33d5607f80b49e792e0a74cb068d810f0

Cheers,
Prabhakar
