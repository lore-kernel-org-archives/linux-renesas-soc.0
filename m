Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA1414402
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420539; cv=none; b=j+tj0BmwiNCsDzb7BXdWF0jDnZFA6r4dWyCg4LxvzBC8mMEXMy75qxtooK+168THETseejUlk2qimUyJ20geO6SNcrb5cm3xIJMIeUO16PbLvZRg8xkXtcMn+0JO9JDKcmGbgRmHe+QbS5EFLeeFqmFgtp76shI2j3TcSfJ+GtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420539; c=relaxed/simple;
	bh=bFgdgeID/Ne6jUxyfD1OKQlY0Yi3oEhR74YsVLKphVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2c2b/NFRVVMFgyGfEAAz9r6sy2LTqcb7YpCzbAyqbeors+PmSbW7mmRa0RhbP1LpHhbinWbjnihrtUtxlWRJBj73mGbAEF5s0mtVz3xCAcj+TwycbICQSg8AhJk/yBa7g0Ez4+FkjDlyWqyKzwDpM+ed1VQllX6RGH/8CdM+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YohSjxCp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YohSjxCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3620B1F0089A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420536;
	bh=NevuUkbIbY8Xir1EiuknrCzVePMTrnsw9qsLi8W12R0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YohSjxCp01Zt1oV1z3JKJOVm5+o3rTPSmNKWplRx5NCegA0TqmNyWvHmtuytndCXQ
	 dTvCmJthVmbF3/i4ftF+QCQIFyqGRZJuZLI9R8xEEIMJK3doIjK4YTunjh2v86QcAn
	 F60L4D5ajVSZvZnGXmU8Tee0h8DgmGt2Dyc78btxDgSEDuukGghOBpOe4kj5kjWKXa
	 4/fNXKz/W9l5YBcdEIrskjFeoDy8oZNov81I2AH2k23wkZcJAWaPNRvg/LwNduRKCB
	 xkzzvDacCxDNfCMYJpjd3HbgMJnc//gq9WID/NVybpSwaklDgESuxhN+KksIzea/PM
	 A0AQuIPLIVvNA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso2700678e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 14:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybhQamjpH8zFkzwu3xhCVm4mcp1AUsmjNKCjqylDyEXcx1th6AFAf0M7XohlYVLv5zJtUdF4cK4DZF9Ke29gkwJA==@vger.kernel.org
X-Gm-Message-State: AFuF++l8OOfJgFNHmoG4k0H23omhUV6TKyEcgug338QTm+t8iA+aR2zh
	9oUpJF40yh+fsU8umLH3gvH04H+xcSl4Lg5A9Ee55HkvvtRLD6NGQ9+L/GG//egcS9VpfWs36Q3
	mGDfQwIFl4P1d0NDBky3OgVEc4xM2/cU=
X-Received: by 2002:a05:6512:3f0e:b0:5b6:183b:d214 with SMTP id
 2adb3069b0e04-5b8ae6a6fbbmr1185441e87.59.1789420534106; Mon, 14 Sep 2026
 14:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:15:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmu2vovxXa9jqX+pq32KV6ONQ-=Yoo3fKF-49oMFVv3GA@mail.gmail.com>
X-Gm-Features: AcwNN1W41lYuox0pw4JKzbuFr7Ojh_AWjTCNy5TnXF9BlZMG2RX-71m9k3IWIl8
Message-ID: <CAD++jLmu2vovxXa9jqX+pq32KV6ONQ-=Yoo3fKF-49oMFVv3GA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Elder <elder@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 5:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
> because it is not necessary for the example.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
