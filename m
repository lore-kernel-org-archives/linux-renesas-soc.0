Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAFA3EBF32;
	Fri,  6 Feb 2026 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378126; cv=none; b=G6TaKHs2TPvjw8n54y4sdX74EifAbVqFPb0yp3Bx2W1Y8pEdQuRb/JFKkXYg0BnQTGxwiOsj7ZVoGVSqsScUVUFng72ICsDXKpofyMLb6LSsqSMRm0L4lRJT6EBLyseKc9GARah3nU52gtMXIiv/OTY985r0jeYd4xKt9mQPo+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378126; c=relaxed/simple;
	bh=/MoS7vvBrbkY5D2m1Gsx/yi0gPlt2om2upSukML2cjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kq/i7PDs0QSXpLe1Lxq2eUSh3IeBpneeaIf0QAVJC4u9guqoT08ezxOCLtF2F9pULlBU6Sas0IVolXDrYMztGGp+WjOp01aC06FUVEVg9PeooVXbOdE5dP2NbRYevGPxHqm3POoQmVT3OYx8OO/w+brCT+br/DA3KZ/ZH1yNFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0zY574r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0zY574r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7FAC116C6;
	Fri,  6 Feb 2026 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770378125;
	bh=/MoS7vvBrbkY5D2m1Gsx/yi0gPlt2om2upSukML2cjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z0zY574rdFUls9/fHhlu6LGAI6ijCu0NzZbJpGbKlRapZEQ4lP0toaZhZunUHiiEO
	 otXSiYSBWVXzR28kfL+I4SU0WbOlX879o/7RWPv3hdJiTHCKb+ZqGXybl3PukxsQ6P
	 GSvHhtmvUw9SkyCzXFqduo6kilIKw9zRIhQJ8hM7GtdQlQ4lbmURj0glYglGi11CiE
	 yQKdDOFaH9ZGLrfr9Dn+ZiaosR7yn2tnbFFj/RQXSGPOeLnzXOyabT/g5HFtV+I/JC
	 mSd1wXxicw5lqrP5FbjvsPZmktYeKR1n8Ck8B+4CeUO7JuG+Ex3zCoRVoDNiMyu+Rz
	 6BRfn8Jcv5tOQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/9] irqchip/renesas-rzg2l: Make fwspec variable as
 pointer in struct rzg2l_irqc_priv
In-Reply-To: <20260206111658.231934-4-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-4-biju.das.jz@bp.renesas.com>
Date: Fri, 06 Feb 2026 12:42:02 +0100
Message-ID: <87bji214l1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 06 2026 at 11:16, Biju wrote:

$Subject: ....: Dynamically allocate fwspec array

or such

> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The total number of IRQs in RZ/G2L and RZ/G3L SoC are different. The

s/IRQs/interrupts/

Use proper words and not acronyms. This is not twatter.

> RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
> Dynamicaly allocate fwspec memory instead of static allocation to support

Dynamically

Thanks,

        tglx
