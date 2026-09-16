Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B394E06E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591781; cv=none; b=a+gkSc7QAclbxDjVcQT500E381WprHDebl6XJT2oGhHeXRYe+QgOkbFVNtBP9Y8WhVf13CsSdCW0tjTHhq7ZlMcdCe5Rqrx0Zb1chsFk5PnPbtBJrdsmtjsgOh/A0J3xTqQuh9bbKT0sxCpVveQgQziz0rvCkkzml7wUadZ+ans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591781; c=relaxed/simple;
	bh=twr8a59Fdfn0ePavAnjHYzK+0b6kl9ZrRxpm4L7/C0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lbCT4VwYseEylgtNhXf2vu1f6sLGPz5dWhHLHuYzMyzxHmv06GI/rg7p9Ba1kgJ/QyDLueixFwC1qL4jXTcSVF1xJk8poqtBiIhNAVm396hMNfWlF1FNpfu78AYirtEPilA3ADdpcaDQUWkTcNvncOJ+M+GqZZKG5f+VDwMdMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/1GcvUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/1GcvUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6F61F00899
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591770;
	bh=wrOPqooVJKR65PqQc6a0txwADa8lEUlA4DFwnEFD/n4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z/1GcvUL+QQ6ELhJi+Hgl5oJUICJOdCQTunyRu2QvSMMTOkNUSmnPRts9mT3vbzI4
	 FVMyVt+0LxPxC20gFHrWFGm70H8BIzdp2J4CU+wmjtZniHACx/5yr/bBGlBsDu6YAW
	 ZvKyZyNueSIJ2LORJQ9ip3MTbbWCH+YaVyVAnYVH4/zckuup1zKzFCxADXD+542Ulh
	 6MQMmGuFbGQdBxSG59jeaJjYGAIHMFgszPM4lcDfE0g3dxfcLxkNR0HtoR6azgEvZi
	 PGi7fBUWB5yuwX0RDh/69FLMGJ3iZu8lFCx3WF9ceWc6VhSWceZTgP1+qdyvMF7DBF
	 IcnF/+Z/afJNQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so130607a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQAvXaO34iT9jRrqCv+R6Je8U0JwjyPBZD/po3+YoI9o34eyBHzgpTb1tcB5LmWZXqXT7cY7YbgUXTxqdzOk0YZg==@vger.kernel.org
X-Gm-Message-State: AFuF++nq28cSuoSpt/IyiocaceNY8+GBQhSpF+i0BW0yjc6B+5e1duDE
	5+WBQcSeGi6LeWDMLEkGm1OnQ+ocQKmwfZqsKdElhalvDfNpAGWkRhRfELPlXQ2O+lAzmLjM/oC
	/btqXp0UEi8SChSapm/FGquakdXjqCg==
X-Received: by 2002:a17:906:99c9:b0:c29:519b:3aee with SMTP id
 a640c23a62f3a-c29f54f0ed8mr67673266b.33.1789591769361; Wed, 16 Sep 2026
 13:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com> <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
In-Reply-To: <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2026 15:49:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
X-Gm-Features: AcwNN1X_UxnU6ZKwsSvWgTeaY6WNtC_ArZgdOyjZ98UNH3XGVrlhWCoa-QMjqBE
Message-ID: <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:55=E2=80=AFAM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 9/9/26 5:31 PM, Geert Uytterhoeven wrote:
>
> Hello Geert,
>
> >> +       /*
> >> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> >> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> >> +        */
> >> +       spi {   /* SPI_1 */
> >
> > As this lives at the root node, I'd rather change it back to
> > spi-ws-2ch-canfd while applying, if you don't mind?
> Please make sure the DT schema check does not complain about it,
> otherwise it is fine, thank you.

It does complain:

      1 spi-ws-2ch-canfd (spi-gpio): Unevaluated properties are not
allowed ('#address-cells', '#size-cells', 'can@0' were unexpected)
      1 spi-ws-2ch-canfd (spi-gpio): $nodename:0: 'spi-ws-2ch-canfd'
does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'

The 1st warning is a side effect of the 2nd warning.

"spi-1" like the comment says if just "spi" does not work.

Rob
