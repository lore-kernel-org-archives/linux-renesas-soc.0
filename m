Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Add R8A77980/Condor/V3HSK LVDS/HDMI support
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
 <20180608082125.tjnd6jayecv26csv@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <12b910a6-d7c6-8d8a-07f2-989e26a010e0@cogentembedded.com>
Date: Fri, 8 Jun 2018 11:51:17 +0300
MIME-Version: 1.0
In-Reply-To: <20180608082125.tjnd6jayecv26csv@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/8/2018 11:21 AM, Simon Horman wrote:

>> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
>> 'renesas-devel-20180604-v4.17' tag. We're adding the R8A77980 FCPVD/VSPD/
>> DU/LVDS device nodes and then describing the LVDS decoder and HDMI encoder
>> connected to the LVDS output. These patches depend on the Thine THC63LVD1024
>> driver and the R8A77980 LVDS support patch in order to work, and R8A77980 GPIO
>> DT patches in order to apply/compile...
>>
>> [1/5] arm64: dts: renesas: r8a77980: add FCPVD support
>> [2/5] arm64: dts: renesas: r8a77980: add VSPD support
>> [3/5] arm64: dts: renesas: r8a77980: add DU support
>> [4/5] arm64: dts: renesas: r8a77980: add LVDS support
>> [5/5] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support
> 
> Sergei,
> 
> what are the changes in this series between v1 and v2?

    See patch #5. I've added the V3HSK DT update there...

MBR, Sergei
