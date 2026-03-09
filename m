Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497FB36212B;
	Mon,  9 Mar 2026 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043435; cv=none; b=msGQVCdLjzB1axdy6g+XNa3QJ+ZGQgUURl/uOCdXqTFm+K0hXc/RtUusStSQNm2BBG3SwvXJE+3suvNVRZ77UL7XR0wPh5wxhF1ggnx10RZ5mDjYgRWRc5oSH1vjplABrBEVjAvCg/lPkTUVPmgPaqMSmbQXkUG1fabtp41lT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043435; c=relaxed/simple;
	bh=HdTeyECHTLJwsjf0F/ekdzRRdPdXu42X8eRpOnWO+gQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=r7Emwoz2i9OIbJ521w1lI9b+iZxWGFp0I3Lj0beBj1K+/qK7f/wK7dvQWtPmSfK3Z65yv7hsnIOpqtFRp7JRbfZ9Zsg4G2U/KNRKcgpjMoyUiYV+6zeD2ipZ9k2V0aaUXBWKbtDt2M/Go88/x1tOqI0w7u4O7lvJiuYfZzvVGJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUPzHRxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUPzHRxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E1FC4CEF7;
	Mon,  9 Mar 2026 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043434;
	bh=HdTeyECHTLJwsjf0F/ekdzRRdPdXu42X8eRpOnWO+gQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=UUPzHRxqwj7s0/hEoVtu8yTq9P1gqWAahF3V1tIvKc7hfQfGemuAeNd6H50hfZRFO
	 Ta/Fpnd9r86MOUiUFgh42kxpqfNwt38OsIOPZ0jTjXws89ineCTOsa0lJZXo8uUNv9
	 PsmRydGnOuCLFouiVmPM3Cl42wmLN0p6CYPdIi1QTND9EmBJrNVhQ93TfbW6jN0Sy6
	 lfGX5xSsANyvLZu1DvlgzNyXIHAWaS8HNJ63gqFcJjy0wZD+IUQPAB1hVG0MBsTbMM
	 zxrh7BJ/FWcevaMO0xTD3l1iGlNCEOZny/+//6GsSO8bphcTEU0rQBa2C52MACaR5N
	 VXOC7X7zZ+UQw==
Message-ID: <909f1667aedfecedb6da752a57043e57@kernel.org>
Date: Mon, 09 Mar 2026 08:03:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
In-Reply-To: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
References: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Thu, 5 Mar 2026 21:58:15 +0100, Marek Vasut wrote:
> Update drm_of_get_data_lanes_count_ep() return value documentation
> to match the drm_of_get_data_lanes_count() return value documentation.
> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> drm_of_get_data_lanes_count() and therefore returns the same error
> codes.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
