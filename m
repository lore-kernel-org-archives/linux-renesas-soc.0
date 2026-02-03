Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DEAEEC3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076872; cv=none; b=pPMlMwQW+qWAzVyIviPju5t550dlGiG1vuRc1iz+G7J36YxI4ny0kjlekFCrgpIJozTbntYhoMmQsMDFoFRLQQ4CSWAx0j3TZ4Ohc0weH1avFf+abdY60Lj6Syunpa3HV91Lts+lcPGGi7LhE/uQEPYzq537KxgLkz+RegO0ZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076872; c=relaxed/simple;
	bh=AEyq+1AGX37SMEthk/OyZ90jnJjCF9WKf64WOKd4zlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeZMo+2qb95jI4Vmexmkz5D9pPs9JcfVyf+80Jiiemj7hBgpZo0Oj2+mNrXXqj+pKAEcHJ/vmc32kGXw5LkFZTnOTTUrefy/49KoyqTGo6+lLLb48HZ/ChrCp0JWDwSmvanB+howEtfqyj206MiAtNPwlYjhLXQx1L9+eZ82Pcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXu30xq4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXu30xq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C19C4AF0E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 00:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076872;
	bh=AEyq+1AGX37SMEthk/OyZ90jnJjCF9WKf64WOKd4zlg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gXu30xq4a9wlx207IAkYKZ8sjlZRRelxZBbiwg6tSS2SG1qCVOJazG2o1tMwZv6Ir
	 RijFwcr0qEjqdI60LbBYejfAArT6PRphViqNBk/mXLWgKMdHGJWWT0gwjCRansd2vp
	 PGKfzqRQ9EvMrCVmFkSIRj3I8Oy70WAG3FxMiuEW1APAfmqbbddkM/w56obZ66DPjj
	 ldFcgIW7tQZ+UBi6pi0gvt8J6Pi9/9Xaz/O6A+5xXKzrkU2jAbVHvSse0eRN1mtuod
	 e7Vf1m9Uu7JdwdnWb+5VQ+2GSI8zfuhyyOXE+skoQhsqBolgCjMY55oEL5VvCS1OFx
	 N7KYEk7IXZaEw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79088484065so46665337b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Feb 2026 16:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHK5MMKoPFEGyA+cugunr134/LKX6opIoA2WtjtFJAk8I1LLYbRqV6Wet0JmWFGyf48zwmagLVHVk8t2CNBtR60g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqDY9KUah4px0nnlYR4AESDyfwP+YjDjWr9jiqv3Ft6nm32FN
	DVz76EnVCurvxektbHtDkM96LC0BXIwMiZhjYvfH8wNzOWokNQgysW7Kk2rTzm0cCM9CnP22eKM
	WoDDSiZPqDP/qcg7BG6dfg6X6LHkwMAg=
X-Received: by 2002:a05:690c:22c1:b0:794:795d:4724 with SMTP id
 00721157ae682-7949df03372mr224092257b3.18.1770076871489; Mon, 02 Feb 2026
 16:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
 <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-4-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-4-e081bcdc1467@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:01:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8w=YueeSdNOEXMU1JAkN=uxv+_jiYAwsHvOexXCzrEw@mail.gmail.com>
X-Gm-Features: AZwV_Qhk0sQ1xC7for89cmEyxVxKxu8RCmnX4B77DqsIpZbHHQR6m7kDjGP8QyU
Message-ID: <CAD++jLk8w=YueeSdNOEXMU1JAkN=uxv+_jiYAwsHvOexXCzrEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 4:59=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> We need to handle the two cases: when a panel is found and when it isn't,
> even though the latter is not supported. So:
>
>  * in case a panel is not found and bridge is, get a reference to the
>    found bridge
>  * in case a panel is found, get a reference to the panel_bridge when it
>    is added, so the following code always get exactly one reference that
>    it needs to put
>
> Finally, use the next_bridge pointer in struct drm_bridge in order to
> simplify putting the reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
