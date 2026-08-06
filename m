Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB4485CC7;
	Thu,  6 Aug 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033586; cv=none; b=bK3LLFJEH/36Y6+Du/8o1Q64eOUzrf0AbCPIwdZjh+JWVhQxi6IobEASFVIfgnBbdmXqn5DjlkP9rN3JKuz9LXWnfEGIIrwBYiA3yF3WOmPvCWzCcVAHhrMfttk2NfJTUFeQElTshdYSGvvQVHGtkggU1T6iT7N5Fhn7h7lpyJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033586; c=relaxed/simple;
	bh=XW4F/eZRyawKMqXn527ROSaXIwWGoXxh5eMtuv25sRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r/aekDGkjtOTbgwj5v2KPme+j0RrMwjhsKwzDbo7nbFDscwKhkQq91WnwGYdFYbxUJCcRVtGfsRvpq+YpY2ACtQ1ZqxWQ1DTDqH/oOE59ngCWYuv7TiQlXFqBfgeVjzrSIqI/VuSMrasfoNXcP/46kICvbA29GW0VZkh1BNv9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLqJ87rK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLqJ87rK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6881F00A3A;
	Thu,  6 Aug 2026 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033585;
	bh=hhiYScBrKlTTcqBuDww6OOpw5eUnNsDP/4rsblKpdrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mLqJ87rK9BZBPb51BmliB0sCFymD9X7a92ABxsTTGgePTP07ch5O8KWhR9iCo4YPl
	 3TLsnC8QsU8EgYIThWKyEHJiE9gGmi7rcIssNd6OR2LkzBczlq93nnc0z8OW9cS2kc
	 HgKB4O1TN1gtRkSFh16P68xRSAM0ssOjITDcrZJh3l3c/hCS/aJPj/S3/shDeEh6Sn
	 1xDNiSLghMnkIE7ryZBffth5T6AKxQHYU0caZXsnzFS1WzmJFXv9gE2YH4zWtJlaDB
	 awFOlvWsKtzXfoumz/nB6Wz4XcrGEgh4a8L2LeoTrNIjEwjtn2Xi69+CMA+NttJ6/E
	 hd8pNwC5mooQw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
References: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen2: Fix double of_node_put on phy
 creation failure
Message-Id: <178603358234.674490.1366685578663811310.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:22 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 03 Aug 2026 20:43:24 +0800, Felix Gu wrote:
> for_each_child_of_node_scoped() releases the node reference on scope
> exit, so the explicit of_node_put(np) in the devm_phy_create() error
> path drops it twice.
> 
> Drop the redundant of_node_put() and let the scoped cleanup handle it.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: renesas: rcar-gen2: Fix double of_node_put on phy creation failure
      commit: b780b8929c759cfa7a892d58625a5ad46cb1cbd2

Best regards,
-- 
~Vinod


