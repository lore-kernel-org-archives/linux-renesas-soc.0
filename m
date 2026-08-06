Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8553CF678
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786029688; cv=pass; b=lzJ8b45nwpU5E4xl/8e5jInQpde/JKtkXQtzt329zh5AGMj/IzLOhXfSVA5mnneORxCaXLSFI8S6CjI+zzZo4N0sxuOPjLU7flfLQbWOSdPmeP2YiTnFQIU/AzFyyax7fQ+crKneE50Aaj2id/vn7M+oPXBeTL30iUaLM96/K3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786029688; c=relaxed/simple;
	bh=wxB1rMiJGb+XlFDizZq+nVcQgjT28U31QAZRBujViJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ+rp7V5U+G4iSf9V85pz6U8tjOqwkEy0Ba7KUpEqrj3JHxiZ4PYuf2NaBsA70k9ZjecN9Zr4RH1PHeas7VHnOcFs/32djJdHY+94vfumvq4L437IqQqQJ82EKhfabX+fVHkGwVnkK4EtOihnUpHXaSCbdGkGgV2hCe5rfDl0nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAgUN9Xo; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAgUN9Xo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1761760f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 08:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786029684; cv=none;
        d=google.com; s=arc-20260327;
        b=sJuVlTMA4DjRstHrJDhBSRylyTqXwoC3RU7WXUu96ZpYbi5nAf79wFC1w0pVYt8Sg+
         jP1ev9X97Sy1ZwAP9vFktMsGIBf31EWzDlxT6wx/5+yXwoTk7ZvUMuG6d1aj4EaQbePK
         SumEBLkxWxXXAkN0kAMHI27IGc5pL1mXVLYlugg7NfyxyaRA7QXtm5dU2JF2VtS8yAJ/
         Dqhvr2JK44b3F52b/wKAGbi2snIbAfZAYxN/LzZfDQWhvxkxrBfPjT5BCx0/dlXWo3zi
         mJq805fdf7KfHej0kCVzpsJXjwczvKaMFAvdj9vFXlJrCCPtwEbbY1rZQf2PTZrg4v94
         0p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD/Z63MkIsQALc17vKMiWHYyP+h2/DD43hjnFmHZM5E=;
        fh=o/4B/J6Qm00vp9WngDLjeBB8/zVHk3Hz8LDrDXkUfao=;
        b=oXpkoibOw6HxUM5beLDafJ//wfoRp0csRipFchcHX5OicRaPphpfF+1F1lwyBB8SVC
         mCKaCmreichTUM3MhZMYYXDrNHHnWn/Og3EbT0bUDFfgeaUMp3nDNrRz0itybPr6k6Nk
         ijpUwbnTsYElIs6g1pEY5gudByOXCG5dcrmy4N1rCXsD3K3d7V2kDEMDZu70h9Ydevke
         Ja5NpxnmKkztgup2TPQWxJZ/pNNyBMw8DWag6WTgMgdXxMUMjJSQd3apIL2WaUn2uWl1
         AZFN77u71Dm894O1w5r5myEOLkUSCg3NqEA9frYyE2s1hYvtURMCaJytY6UOeYlmZWmn
         JCKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786029684; x=1786634484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD/Z63MkIsQALc17vKMiWHYyP+h2/DD43hjnFmHZM5E=;
        b=NAgUN9XoA6qlinDP2aztvB+pbih4zWigwt1MH1tKaYp3jFpHGuVUyJVGLUyJMqXmVc
         IY+OoDrArY72rplD6YNvvqxSPGOrfEn107q+ew2dSZS/zvvFGmP9tOp/GfYz5aE+854+
         oPeMcGonBhmVThpTGWeDEXnuOCFXr91WePYMBBCuQjiXQN8IjlVu2sZ44bk7TpVLBZRq
         ThtNuK7IGiNZ78VNZqH40KxpUVbWDl1ydBHPOPmuNGkbErhBG8edQWYSsWRzrXldvDAZ
         YWJUjvHx+ylyvWcfsnoLnP9IQBsff7oEGE3xA+8p7BcknG8MbBGs5YpEfM5MVHNdKynW
         sG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786029684; x=1786634484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD/Z63MkIsQALc17vKMiWHYyP+h2/DD43hjnFmHZM5E=;
        b=CXDb1mk5SjDOho0nZCHZjoFQfdbDqJiTBEYXUv07m2C1Jec0gemzf8z8uAeKYiaSSx
         7DXNU+lOIafaSjN2mwL9lkkzwL67anh7q/dXwTBfcVf2KVTHH4eM0IDqBV7Gi4UwLaKn
         ckGSr5gmmLG9HdGUlYZAyshNb1N6eoFUTnrmgLRfxz2GI/dF95EQD+uBK0mEj7xHaLKk
         DAVGjZbkP3OfMUKrmxWdn/IMP9ARpvJglkyJ2Qc4U9FmWWiXBOrLsNbDr1nFeCERBfkq
         Mas8z/kB1J3SMhNTIyKYG5ZoddI6AEu6y+Kq1pBd0dztm9vn541LAye9Jm88xHKtzJXm
         f5WQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXQnkhPigtnzJFb15qrL7DDXtZfFVlHlxdd3i6JRCFM8ykge0nYrhLLTPDSi3Wp77XsZ0ZMbDuQFzCMZPerGDfYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90ah4TlZo+v9InY3eSWYTZQpbuXIKYVwf9RGvCiRXZyFKwe/u
	SfzJh3HZuqWXnCsArC6u+xfy4RbV7Y9pnBaAi0LOAygf/yqJDQ23yib6OL6N4jA0aUM7Q29QcBL
	PqGXGkq+HS+i42JWq5HyKr7KgAD1Q1jc=
X-Gm-Gg: AR+sD10uraodtAYs+y2OM9WFt20vtuw+tJQ1Eyno5ZvQskofY65mSPcNGHhzCN+gDbn
	fRZr5WMOA9wJh/Zoyor4gfBLVxmXMZhOZytDPHAOaoIRmVJs2KTVQEdpVCh+HtIp5NsJi66ZUzT
	wOfQ+N9h/Kki822DzzbU3bPDRk4+qbRN/0ZuRI4gIrqO/UR+apNavmdEKA0kzwxxyoELq2/JLNU
	KeM2+xOvFQpEOMZcAc5vFWEBB54WoQXHV8hmih2Nvr15OW7ddw+3Vg6qnOebcuYT+ykdmaG3KXY
	qfjqoHlrfOEmsDmrxJC6oZ4PVIhT0i4l0evB4U7qzgdjF2nqaEDLaN1os4dR4jQ9pPyITjX2sm9
	uc3HCxn17uEPC6o4bTlQWlQaBd+mQx5V5
X-Received: by 2002:adf:fe0f:0:b0:47f:eb37:fb7f with SMTP id
 ffacd0b85a97d-47fec51952emr20652797f8f.16.1786029683487; Thu, 06 Aug 2026
 08:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com> <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Aug 2026 16:20:55 +0100
X-Gm-Features: AUfX_mw4r8HPUvhFNWfzBe-QL0Bj-jhWO3_COwMvVVhYlGm-HI72ckTzEAHnAsQ
Message-ID: <CA+V-a8tR=eeLwGgnEXnw6teyHYeUapcd94xZNATSmuKUgJK_fw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@lysator.liu.se, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, peda@axentia.se, 
	p.zabel@pengutronix.de, ulf.hansson@linaro.org, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Ulf Hansson <ulfh@kernel.org>, Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 11:19=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> bit of the VBENCTL Control Register. This register is mapped in the
> reset framework. The reset driver expose this register as mux-controller
> and instantiates this driver. The consumer will use the mux API to
> control the VBUS_SEL bit.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v11->v12
>  - No changes, just rebased on top of next-20260714
>
> v10->v11:
>  - No changes.
>
> v9->v10:
>  - No changes.
>
> v8->v9:
>  - Fixed driver comment year (2025 -> 2026)
>  - Switch from devm_regmap_init_mmio() to dev_get_regmap().
>  - Drop unnecessasry include bitops.h, of.h, property.h and
>    drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on re=
gmap.
>  - Collected PZabel tag.
>
> v7->v8:
>  - No changes.
>
> v6->v7:
>  - No changes.
>
> v5->v6:
>  - No changes.
>
> v4->v5:
>  - Changed file name to rzv2h-usb-vbenctl.c and Fixed
>    Makefile, Kconfig, function names accordingly.
>  - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
>  - Updated commit msg.
>
> v3->v4:
>  - Removed mux_chip->dev.of_node not needed.
>
> v2->v3:
>  - Added mux_chip->dev.of_node =3D dev->of_node->child as the mux-control=
ler
>    is an internal node.
>  - Fixed auxiliary_device_id name.
>  - Get rdev using from platform_data.
>  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
>    as it is needed.
>  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
>
> v1->v2:
>  - New patch
>
>  drivers/mux/Kconfig             | 11 +++++
>  drivers/mux/Makefile            |  2 +
>  drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
