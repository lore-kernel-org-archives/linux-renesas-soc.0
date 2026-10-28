Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176701;
	b=KBSGfE6UjB56Ilwx6ldAXFtgTrl8pMonTEcUpnIqKU6jb6zCc/BJ2E2MX7gdyQzxEk8s
	 R76RJqqLhoP9pJ6hSeuSkuDaKh58J8kDFSjNce3j0Ry3cbdVxRte4rrrRZYZLA29YcT3L
	 t6zC42HTApEiLP58PAp+zAYOwaMhC4quNXFfsW8Jmd37mvADHNGaVtaLNb/amYZYcBaTx
	 oUnyHaN+q/QArLToK0SqNJpIvWTEbdpIoZLLDtfNy7V9UZrHofJ5yC7tUAnElSd7gU9D5
	 PWBdgRUNXqLoLT94uFLne3I9fFGCCbJH8Xn0pw0YRrfq0/Yprw9jryVFgjB8XQbf+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176701;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ds+sDQMFPbc9ApWwB1b5JKVHZBOJmFGms0FMLfxMiqU=;
	b=NfKYr/IQcWFM1U7zE1J5CVqnpX6imc0vz2n80L4Vm5CGt+P7N1rEtghv9/IMm7Gq0r3f
	 +iTm200J4fZ7IFtVfTyjWwqVj+sLfsq/tiK5587S8BPK6m/Su+2PHMcFWvWqsDca5e1IT
	 Pt6LqI5re71Txeyep0Fp0chnRXiWmheLj6sv546KER0Rvo6SA7sWQn7P46vD/QR5cIErM
	 lJ2CgJkIVALMorG/LrQIkxbuYogC/x03TPBKr5HZEozv2F4L0bhwLR2prjfqqjAR+AiGK
	 V7Uo7GFU4oY6PCgTR+RCWQHDflmM8sbUo93MNLB+STr6b2Dhbz1ZvW17lz5sNwqGPng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ+wUHpR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A6606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ+wUHpR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0191F031E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176700;
	bh=ds+sDQMFPbc9ApWwB1b5JKVHZBOJmFGms0FMLfxMiqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nJ+wUHpRA6Ee42y3iixK1FzjdZKkGKKIESyVw/P6gWDeP+G8JYuhEUAYec3mE3iiz
	 6SCNV3vLTuf/1oH8aQICVLNXfsoHyxUqdsVUaHgmGUsyD1BJXq3fRc4/Wf0r6FcSA9
	 /EehI6ZXuQGbvcVXVlpKQdgp+QF792SnKTVdV48vXzhOZs8bNZhsdK5FBox78it5Pm
	 WW6da7J1iLgxY0X7PwNzPNsRcnnmm6a4SIL3m5LCNt2l5HCzj+epga4RtniD302Mbi
	 5EQ7OIh3K1iPeQ8zHK4AxCF291jwA0CQtlkMdFRh80qHBU8lYvej1mvc2I00goFzII
	 fviKaakmES56w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so701797e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 01:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwC3xSyWpIcq6R4q2J/RxGluUpj6AJ3dVCmgDYv97mYEG7AB7BLR+9rRb+PFn+7+6KLIaXCephezP/ElhU90pjTJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPNy9Sn6uI4aL1QXOh3eLthSYLaUKHN3qpJbSoOeLMUObg9kVt
	YZJvuIT9l2IJsszrfK6iEgu4bxaW7P2iCyMDs5vJecO/BkUUNZLWilIdPdK2yKEHxh9jcNsMxvN
	d6BfxV1Qxd5DiabSazIezb6tuzdXATPQ=
X-Received: by 2002:a05:6512:b91:b0:5bf:b5bf:e92f with SMTP id
 2adb3069b0e04-5bfcad7b397mr666353e87.20.1793176699104; Wed, 28 Oct 2026
 01:38:19 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
In-Reply-To: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 09:38:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
X-Gm-Features: AclHuK8tJBeR9yJrkj0y_HKO23Ga5j5ClBJ0KNeeuFyuuCRknUQ0tBWZXJ_fohw
Message-ID: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> The driver uses Runtime PM, but I see no calls to
> pm_runtime_resume_and_get()?

It gets grabbed in *params.c and *stats.c:

linux/drivers/media/platform/arm/mali-c55$ git grep pm_runtime*
mali-c55-capture.c:#include <linux/pm_runtime.h>
mali-c55-capture.c:     ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-core.c:#include <linux/pm_runtime.h>
mali-c55-core.c:        SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
mali-c55-core.c:                                pm_runtime_force_resume)
mali-c55-core.c:        pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
mali-c55-core.c:        pm_runtime_use_autosuspend(&pdev->dev);
mali-c55-core.c:        pm_runtime_set_active(&pdev->dev);
mali-c55-core.c:        pm_runtime_enable(&pdev->dev);
mali-c55-core.c:                goto err_pm_runtime_disable;
mali-c55-core.c:        pm_runtime_idle(&pdev->dev);
mali-c55-core.c:err_pm_runtime_disable:
mali-c55-core.c:        pm_runtime_set_suspended(&pdev->dev);
mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
mali-c55-core.c:        if (!pm_runtime_suspended(&pdev->dev)) {
mali-c55-core.c:                pm_runtime_set_suspended(&pdev->dev);
mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
mali-c55-params.c:#include <linux/pm_runtime.h>
mali-c55-params.c:      ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-params.c:      pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-params.c:      pm_runtime_put_autosuspend(params->mali_c55->dev);
mali-c55-stats.c:#include <linux/pm_runtime.h>
mali-c55-stats.c:       ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-stats.c:       pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-stats.c:       pm_runtime_put_autosuspend(stats->mali_c55->dev);
mali-c55-tpg.c:#include <linux/pm_runtime.h>
mali-c55-tpg.c: if (!pm_runtime_get_if_in_use(mali_c55->dev))
mali-c55-tpg.c: pm_runtime_put_autosuspend(mali_c55->dev);

So are you saying these runpaths are not necessarily getting exercised,
so the reference doesn't go up on normal use cases?

Yours,
Linus Walleij
