//
//  Data+Additions.swift
//  Copyright © 2019 Observant. All rights reserved.
//

public extension Data {
    enum Error: Swift.Error {
        case write(Swift.Error)
        case contentsOfURL(Swift.Error)
    }
    
    func ft_write(to url: URL) -> Result<Void, Error> {
        do {
            try write(to: url)
        } catch {
            return .failure(.write(error))
        }
        
        return .success(())
    }
    
    static func ft_contentsOf(_ url: URL) -> Result<Data, Error> {
        do {
            let data = try Data(contentsOf: url)
            return .success(data)
        } catch {
            return .failure(.contentsOfURL(error))
        }
    }
}
