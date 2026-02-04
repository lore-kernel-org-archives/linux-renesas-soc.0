Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7F41C31F;
	Wed,  4 Feb 2026 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218528; cv=none; b=Dtviv6vZqAM1U0GdiaWPFonH5veWoj5NEQXr977IjIkaPRblZ17sFOK7K96Lj9vWEGeeMM5aZuVg0rZjakG99RNolWU9W0FcS4Lj8r/7THP0i8NpBkSZiVULqPK41pV2Q8QxlVowUX4l5iWhhWUW4CGphr5ydI/1ENl6uKoFFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218528; c=relaxed/simple;
	bh=J7ArmKCd79+jTdq1HkYeBhulemiAhITwl+MVGrfJ7aY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YQ6mIrdbAz/5WUNGcOjX617uHpfxpuzoTod6h/48u+v8SVHJnEv+5m1z90UB2hDBed7CWJkvne8IqErHR7xDMGybuFoOatCd4s0B9df85mmwfGQMLdFwMAlGLLCM9cOryxt/hy0Fhi8GJI+ZcYSZ1m0HMtcdWbYImMHOJTQ6fGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JG1sviZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JG1sviZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76108C116C6;
	Wed,  4 Feb 2026 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218527;
	bh=J7ArmKCd79+jTdq1HkYeBhulemiAhITwl+MVGrfJ7aY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JG1sviZBC6i1uxLSpW2jmWb35BNKqtHVJAD2/tfVpl6Bs2bgJEkQNwH4dyaJRPS6U
	 r6Id7Mj/Lykq7JoWdD0W+I/lwSIVNVv4/59xzFQTBGA34IMy1YCDtE0nd1ePoU//am
	 YJdtndpf7wGnA0o9oEDK7uLS26QUaTFjO2aokIaUolZw6+KlR+TzvGHUOM+phzY4iH
	 qve9XLYw7RC16W5oJfkUjCcCEfQN/pRAXTeNkUuDB4M2NwqUZIk6Kmc5okcrmtaONc
	 szqftFbCWiX+nA9ivItQEWa/GIHzCEysa4DXUAcXNRu+ozrpWzDOWjIqZMS5M8221G
	 BsfhrsNlFCkkw==
Date: Wed, 04 Feb 2026 09:22:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
In-Reply-To: <20260204142320.103184-2-biju.das.jz@bp.renesas.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
 <20260204142320.103184-2-biju.das.jz@bp.renesas.com>
Message-Id: <177021852663.2044780.8530228995216202645.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC


On Wed, 04 Feb 2026 14:23:09 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document RZ/G3L (R9A08G046) IRQC bindings. The IRQC block on RZ/G3L SoC
> is almost identical to one found on the RZ/G3S SoC with the difference
> like it support more External IRQs, GPT Error Interrupts and also has
> additional registers for GPT/MTU IRQ selection, shared IRQ selection
> between external IRQ and TINT. Hence new generic compatible string
> "renesas,r9a08g046-irqc" is added for RZ/G3L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 66 +++++++++++++++++--
>  1 file changed, 62 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:9: 'irq8' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:10: 'irq9' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:11: 'irq10' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:12: 'irq11' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:13: 'irq12' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:14: 'irq13' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:15: 'irq14' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:16: 'irq15' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:17: 'tint0' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:18: 'tint1' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:19: 'tint2' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:20: 'tint3' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:21: 'tint4' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:22: 'tint5' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:23: 'tint6' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:24: 'tint7' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:25: 'tint8' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:26: 'tint9' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:27: 'tint10' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:28: 'tint11' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:29: 'tint12' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:30: 'tint13' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:31: 'tint14' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:32: 'tint15' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:33: 'tint16' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:34: 'tint17' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:35: 'tint18' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:36: 'tint19' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:37: 'tint20' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:38: 'tint21' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:39: 'tint22' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:40: 'tint23' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:41: 'tint24' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:42: 'tint25' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:43: 'tint26' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:44: 'tint27' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:45: 'tint28' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:46: 'tint29' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.example.dtb: interrupt-controller@110a0000 (renesas,r9a07g044-irqc): interrupt-names:47: 'tint30' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260204142320.103184-2-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

