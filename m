Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB93A5E7C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554866; cv=none; b=n6NGDyHr9PAJkegt2V8esqU1Fav9gOUbov4xcxrhGr0N62ztL3OSiuL3cB3PHAPKupmzVCEyK/o6vsAAw8S9BLw6x13UUXJsU3gfvsHwAjU/dsyCsDmoJ1jvoDAznobGI/XPI+5SSO8Msj383pwzuA7Wv4uHSPwcBuIl6rvhGBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554866; c=relaxed/simple;
	bh=8SsH9km5SAPgEpA4A8y8P5I4CMQaaNq+s3t7JW1Vj4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZAY3yaMbaqfUPoY/P5d4amx2WaeA7UMqzxAbqIXtWBSuif/M/AsJ+FPHIqV5PlCZRRJ1rPvu/MTz8yRsg0grKt/QhmSOoN5o5HzeQQmenNU4qGfdHnDRAll0/BjWaciFBITZ1h67sUjBgfWGXYHiIyYw6qS+zKCgCWtbvqAv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8JOJBER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8JOJBER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C836C2BCC7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775554866;
	bh=8SsH9km5SAPgEpA4A8y8P5I4CMQaaNq+s3t7JW1Vj4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m8JOJBERsYI95/CH4JpQNjrjthcI64rsM9S9Da9h+DVNs99MxjlHJbDb5gY+G90Ku
	 2bdTelWl2YBcvx9r/adp7+awLosyMEukuPeLjqKDLUQI6U0ym3+L0EUMxIBAx3ZYWw
	 yAybDA96+zImeL9jFiQbdah32ntGQtcEoHe4QWf3h8RsIyFGaG2IpBT60siqg9x1of
	 PTy833Gjj/OuNGJHaQn3kqhLxGtNTF9mfynaa2Srysw1HvSo2pkTSVDhmkuTPrDTPu
	 inqct8VhoMJgeFQJ+fUKDiP98gVvPRosvT6DxbrgCXUl94N8wpYSTH9oSp7KU5W/Wy
	 u+9NvPsb8LP2Q==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7982c3b7da9so42216007b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 02:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgN0mwYnHQa0joh6RF4AJK4AF0vuq7cI5YFZaI9eH/x+MTXFXsSg4oof9VjcywShguHqddJN6dqsz5hWShrcvkuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlPOUzqgcwDn0BwwAodIFr4aMEcmdx4xtBOQrD/nwr+a0DWmD
	8P2XSv+T32h/9bEQ9JqQF88UXp58So1HxUpJkt4e2Mt76nxcxuHYdJbVGVjQO3/ALYzvMREwGhr
	byDwwdE3Diz8KHJBI2fV+DMprLWP6bOo=
X-Received: by 2002:a05:690c:dd5:b0:79f:2e53:8606 with SMTP id
 00721157ae682-7a4d5c5e341mr167507727b3.41.1775554865754; Tue, 07 Apr 2026
 02:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:40:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLn7mP0_vDSSrvce-C+o20_sqNpviX7BKWTRn_uX8sNgnQ@mail.gmail.com>
X-Gm-Features: AQROBzCfmWCuyLKdrRJGc7j_WCHfiMGHBS625Ijb9YPfc09N8yvcvrOHpbgfT-8
Message-ID: <CAD++jLn7mP0_vDSSrvce-C+o20_sqNpviX7BKWTRn_uX8sNgnQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] drm/bridge: convert users of of_drm_find_bridge(),
 part 4
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

On Thu, Apr 2, 2026 at 6:27=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:

> This series converts many DRM drivers from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() whic=
h
> allows correct bridge refcounting.
>
> This is part of the work to support hotplug of DRM bridges. The grand pla=
n
> was discussed in [0].

All makes sense to me. The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
