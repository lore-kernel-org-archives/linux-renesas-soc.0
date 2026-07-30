Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A843E3C7A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401532; cv=none; b=PItFpm3qk/shs1vVjkc3j7ts1uIaEc4/8O5Ktelgng/Z0Ks/U/q8DYGXYPGyLuFmaOfswG/VXe6s6tjeZQN+AeLRH2DK3b/wjTRPpWp+ji4DxfObI53M0L31MMyxlJ+OkSRRxb2WuwZWU5kdM0zxHxXtZHyoExC2XL5VLUmjIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401532; c=relaxed/simple;
	bh=P0s9hpnOoF4rnWi7XE5IqmTuWPlqLa2592IkfQmX430=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LinCTkWJTC49Uc8EZBkRKyMZEKNmJl36zbxEIO13Sie8JWErsov59hu3CMUZslYON5KzoCqEJcsZrrerHrI/d5Yu//K8tn9CUdWz5l3WCyuF3oJqbWP80gQwtF24vIxYogMu70NJppYxLRrUrDAeYAzumqePu8rWCGD/s3YIWhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btX0TtJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btX0TtJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF481F00A3A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785401528;
	bh=P0s9hpnOoF4rnWi7XE5IqmTuWPlqLa2592IkfQmX430=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=btX0TtJBl2bLrcUEL4Od6ngVqeNS4+4qlE8XAPorAh9OPuSH86FgDJaZZPTjmKHlu
	 +6oYaV7DE6tpjf9gmVbJBCTqTf5Jczl1DW3MYk4Pjryyi9R60h+sTc656XQFLgyzHD
	 XrU8ALCsgVVJTBY5cFwxB50hMQhdcrgObIruqUIqUZ/LNNYwIrP6g6OS3o+Ocv7OAG
	 SgFOkSZZv+h7qaY0XQUh68uUDzg6Zpoqvo0QvTcgUxgQcepjNgYhRGSdn5T0qftrCN
	 X5C0G9VMCysyKxSTqtprIEMh95fK3U11R3XfsDM5OaJP65hDqcmSqqLPb+YlU30TDC
	 Y+r4v33g6sr2w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2021286e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jul 2026 01:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqgj60tn+XkHuokobpC31rXMGrFGfke4S1rtJ69YKWZ7zaKV2SPyVWi+2CgpjeXVe5/p6du8GwsfTxoDxCB4BEoVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuMrSuwnAvRYpE7WouSx6GdaLsn/u8dgXJgTE/12oNBhmRNa3
	E7q+yFhlTKATtm3wbElyHGQ8i9JMqaJT4Uz3gig77dJEpzfBrPwsbgaQwgPi1CmFTcE+Qex/igp
	w3s48XdrF1ms7Lgq3dyFyA4fUpP+clGXYBgU6Jnwtsg==
X-Received: by 2002:a05:6512:6894:20b0:5b0:ceb2:194b with SMTP id
 2adb3069b0e04-5b2db36f116mr194574e87.36.1785401527295; Thu, 30 Jul 2026
 01:52:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 01:52:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 01:52:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <TY3PR01MB11346732C04ED0DC52502267B86CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
 <20260725123433.162348-3-biju.das.jz@bp.renesas.com> <CAMRc=Mf_oNCQK3o5-s4u8zejkVWM4WN_R9YO+NA4od0qqtGjow@mail.gmail.com>
 <TYCPR01MB11332A50145F29D93157A58BC86CB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMRc=MdU12B-+vQxCuFVuoJLLza_51-bv1o1T9VYEHbkiZF1EA@mail.gmail.com>
 <TY3PR01MB1134633BC06738344A740654786CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMRc=MfOk=+dQvdEAY1ah=G1JNM=p7J6=+Tz_uCYDQGBMxXHqA@mail.gmail.com>
 <TY3PR01MB113462C8DE3B70428F113ABF386CB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMRc=MeybezmErzs9+jYaBgXr+ufsTv5_V5sZjhP6ynuQk+W2Q@mail.gmail.com> <TY3PR01MB11346732C04ED0DC52502267B86CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Date: Thu, 30 Jul 2026 01:52:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdAsZwqQxJ_G0VXjyFjDzUfT5WSoSW4t0RGtAiyw8FQXQ@mail.gmail.com>
X-Gm-Features: AUfX_mxwuZ4AleOIKJ06LwMAbeiwmTGJdUtdnJMlxTOISOQMWh841snC5GH3dYU
Message-ID: <CAMRc=MdAsZwqQxJ_G0VXjyFjDzUfT5WSoSW4t0RGtAiyw8FQXQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"magnus.damm" <magnus.damm@gmail.com>, "biju.das.au" <biju.das.au@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 16:33:31 +0200, Biju Das <biju.das.jz@bp.renesas.com> said:
>
> Here it is. Please find the relevant DT nodes usbphy-ctrl [1] and dsi [2]
>
> [1] https://lore.kernel.org/all/20260729115022.222340-9-biju.das.jz@bp.renesas.com/
> [2] https://lore.kernel.org/all/20260729125516.230757-14-biju.das.jz@bp.renesas.com/
>

So the sysc is the parent of the power sequencer but there's no relation
between it and the consumers modeled in DT?

In that case some validation is still required: you should make sure the
consumer device is compatible with a list of devices we can service. sysc and
consumers also seem to share the parent node so that's worth checking too.

We shouldn't just return MATCH_OK for anyone that comes knocking.

Bart
