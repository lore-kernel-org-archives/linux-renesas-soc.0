Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99617B50F;
	Sat, 14 Mar 2026 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486583; cv=none; b=o5PDt0BZKrRDVELZcd2R8yjhkQzOs/4p7lVG006ZOt+EbrNUC77cxSEBozu4mY3LHqw1HXbB0/jS3m3aNgy99Xy7F42dCdGYFfFb1q2j0E6FNO6KIaeIV+cWWbphN0RqsEnD59CQEOL8GcJ8zvt6f2IA/6JN7GXAYYFuEO1WjWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486583; c=relaxed/simple;
	bh=YlEyIcFGjh0GIEgUBI/sL06NVS7FD4Z0AvbOPmvJT28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdo1dgK0gd199pIkSgN0Jm1rPUgHUytkuRGQbv+v9Gme5thuBMuY0im+pTrN/3iO3Gphhnmrd0pUK87wRy3IKzoRMbc9SrEYqdXqKF3Ul4ZRRZnTUH6L/gBsTbKEWW2xip/C9ySQ45Bda5JCOvaWdD5QNh/dGREPQAqdQJfqFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaRWg38A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaRWg38A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC44C116C6;
	Sat, 14 Mar 2026 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773486583;
	bh=YlEyIcFGjh0GIEgUBI/sL06NVS7FD4Z0AvbOPmvJT28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaRWg38Al81OiGCzfASSu/9rEd1DeGXqI+UafyXX2ylI7eUrg5gpMSQLYtYLK60Wt
	 di+UOvtq4aABLxy+M1wZSi6mNURAeFlFpJotEsePrCylmE/MFhabj5O0UrgHc8/2HM
	 Az8ilZlwMQp6XK6A5vz0IElR5KVZUK+/3RQnBqt/467HN4h9/qmpDa5jD6V63/dvR/
	 YVK2w8N/o9I7mY/YZh/VFxh/vY9GKRCpr/0sT4JLmdFtZvyBi4pr4AP0y5UODXQA9c
	 1CHZIAXirdcAaSiHk24irfKrFdRKDjKKzdfkLCHxknuOeFvjbHnic8Bc3h4B7DkYGS
	 gvZoc4Nsvtiyg==
Date: Sat, 14 Mar 2026 12:09:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
Message-ID: <20260314-quick-gray-saluki-0f96ff@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399673.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399673.git.geert+renesas@glider.be>

On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v7.1-tag1
> 
> for you to fetch changes up to 3ac4e6b92fc200e047d13aae06224b2a72539b9e:
> 
>   dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC (2026-03-06 13:38:54 +0100)
> 
> ----------------------------------------------------------------
> Renesas DT binding updates for v7.1
> 
>   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
>     SMARC SoM and Carrier-II EVK boards.
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK

This is DTS branch patch.

>       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC

This is drivers. Splitting it into additional branch is not making it
easier. I don't know where is this supposed to be merged. I will take it
to drivers, but in the future, please do not put DTS bindings into
driver bindings.

See also submitting patches in DT dir.

Best regards,
Krzysztof

